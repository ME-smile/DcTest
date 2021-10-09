/*
 * @Description: 所有请求类的父类
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:11:45
 * @LastEditTime: 2021-09-03 18:08:55
 */
part of http;

class ApiRequest {
  String path;

  ApiCacheConfig cacheConfig;
  Map<String, dynamic>? query;
  dynamic formData;
  Options? options;
  CancelToken? cancelToken;

  ProgressCallback? onSendProgress;
  ProgressCallback? onReceiveProgress;

  ///是否显示加载 一般在post提交时 置为true
  bool? loading;

  bool? withSeesion;

  ApiRequest(this.path,
      {this.cacheConfig = const ApiCacheConfig(),
      this.query,
      this.formData,
      this.cancelToken,
      this.options,
      this.loading = false,
      this.onReceiveProgress,
      this.onSendProgress,
      this.withSeesion = false});
}
