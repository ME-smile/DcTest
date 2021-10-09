/*
 * @Description: 日志
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:21:21
 * @LastEditTime: 2021-09-18 14:57:24
 */
part of http;

class ApiSessionInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    String? session = SpUtil.getString(SpKey.ACCESS_SESSION);

    if (session == null) return;
    options.headers.addAll({"Authorization": session});
    if (options.extra["withSession"] != true) return;
    options.queryParameters.addAll({"access_session": session});
    Map extra = {"access_session": session};
    if (options.data == null) {
      options.data = extra;
      return;
    }
    if (options.data is Map) {
      options.data.addAll(extra);
      return;
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
