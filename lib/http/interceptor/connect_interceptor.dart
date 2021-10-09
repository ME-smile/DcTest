/*
 * @Description: 网络状态监听拦截器
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:34:19
 * @LastEditTime: 2021-09-03 16:46:00
 */
part of http;

class ConnectInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _request();
    super.onRequest(options, handler);
  }

  //不知道是不是这样写，网络的
  _request() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    } else {
      print('没有网络');
      //在这里加一个错误弹窗
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
