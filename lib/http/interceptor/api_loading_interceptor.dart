/*
 * @Description: 是否显示加载
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:46:06
 * @LastEditTime: 2021-09-18 14:55:05
 */
part of http;

class ApiLoadingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra["loading"] == true) {
      ToastUtil.loading();
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.extra["loading"] == true) {
      ToastUtil.dismiss();
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ToastUtil.dismiss();
    super.onError(err, handler);
  }
}
