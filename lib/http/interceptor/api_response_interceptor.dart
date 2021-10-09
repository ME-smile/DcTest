/*
 * @Description: api返回结果拦截器
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:39:38
 * @LastEditTime: 2021-10-08 20:20:36
 */
part of http;

class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is List) {
      handler.next(response);
      return;
    }
    response.data = response.data.toString();
    if (response.data.isEmpty) {
      handler.next(response);
      return;
    }
    try {
      response.data = jsonDecode(response.data);
      String? code = response.data["status_code"];
      String? msg = response.data["msg"];
      if (code == null) {
        handler.next(response);
        return;
      }
      if (code == ApiCode.unlogin.code) {
        // handler.reject(UnauthorisedException(code, msg ?? "未登录"));
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: UnauthorisedException(code, msg ?? "未登录")));
        return;
      }
      if (code == ApiCode.notAllowed.code) {
        ToastUtil.error(msg ?? "请联系管理员授权");
        // handler.reject(UnauthorisedException(code, msg ?? "未登录"));
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: NotAllowedException(code: code, message: msg ?? "未登录")));
        return;
      }
      if (code != ApiCode.success.code) {
        ToastUtil.error(msg ?? "未知错误");
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: UnkonwException(code, msg ?? "未知错误")));
        return;
      }
    } catch (err, s) {
      handler.reject(
          DioError(requestOptions: response.requestOptions, error: err));
      print(s);
    }
  }
}
