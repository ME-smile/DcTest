/*
 * @Description: 接口打印
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:10:07
 * @LastEditTime: 2021-10-08 20:17:59
 */
part of http;

class ApiLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    developer.log(
        "*********${DateTime.now()}*************************请求路径:${AppConfig.environment.APIHOST}${options.path}**************\n");

    developer.log(
        "--------------请求query参数:${options.queryParameters}------------------\n");

    developer
        .log("--------------请求formData参数:${options.data}------------------\n");

    developer
        .log("--------------请求header参数:${options.headers}------------------\n");
    // options.queryParameters.addAll({"access_session": session ?? ""});
    // super.onRequest(options, handler);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    developer.log(
        "-----------${DateTime.now()}------------请求结果：--------------------\n");
    developer.log("${response.data}");
    handler.next(response);
    // super.onResponse(response, handler);
  }
}
