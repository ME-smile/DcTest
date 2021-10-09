/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:23:32
 * @LastEditTime: 2021-10-08 20:22:31
 */
library http;

import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flustars/flustars.dart';
import 'package:ty_flutter_cli/config/app_config.dart';
import 'package:ty_flutter_cli/config/env/app_environment.dart';
import 'package:ty_flutter_cli/constants/sp_key.dart';
import 'package:ty_flutter_cli/router/app_router.dart';
import 'package:ty_flutter_cli/utils/toast_util.dart';
import 'package:get/get.dart' as g;
import 'dart:developer' as developer;
part "adaptor/base_adaptor.dart";

///dio 网络请求层面的异常
part 'exception/base_exception.dart';
part 'exception/unkonw_exception.dart';
part 'exception/bad_request_exception.dart';
part 'exception/unauthorised_exception.dart';

///api 业务逻辑上的异常
part 'exception/api_exception/base_api_exception.dart';
part 'exception/api_exception/unlogin_exception.dart';
part 'exception/api_exception/json_modelize_exception.dart';
part 'response/api_response.dart';
part 'exception/api_exception/data_invalid_exception.dart';
part 'exception/api_exception/not_allowed_exception.dart';

///业务code
part 'code/api_code.dart';

///代理相关配置
part 'proxy/proxy.dart';

///拦截器
part 'interceptor/connect_interceptor.dart';
part 'interceptor/api_log_interceptor.dart';
part 'interceptor/api_response_interceptor.dart';
part 'interceptor/api_session_interceptor.dart';
part 'interceptor/api_cache_interceptor.dart';
part 'interceptor/api_loading_interceptor.dart';

///请求封装
part 'request/api_request.dart';

class Http {
  ///超时时间
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  static Http instance = Http._internal();

  factory Http() => instance;

  late Dio dio;

  Http._internal() {
    dio = Dio();
    dio.options
      ..baseUrl = AppConfig.environment.APIHOST
      ..connectTimeout = CONNECT_TIMEOUT
      ..receiveTimeout = RECEIVE_TIMEOUT
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      };

    if (PROXY_ENABLE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY $PROXY_IP:$PROXY_PORT";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
    dio.interceptors.addAll([
      ConnectInterceptor(),
      ApiSessionInterceptor(),
      ApiLogInterceptor(),
      ApiCacheInterceptor(),
      ApiLoadingInterceptor(),
      ApiResponseInterceptor(),
    ]);

    //   dio.interceptors.add(RequestInterceptor()); //自定义拦截
    //   dio.interceptors.add(ConnectInterceptor()); //拦截网络
    //   dio.interceptors.add(LogInterceptor()); //打开日志
    //   dio.interceptors.add(NetCacheInterceptor()); //缓存
    //   dio.interceptors.add(HeaderInterceptor()); //头部拦截器
    //   dio.interceptors.add(LoadingInterceptor());
    //   dio.interceptors.add(BlocResponseInterceptor()); //业务错误拦截
    //   // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    //   if (PROXY_ENABLE) {
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   client.findProxy = (uri) {
    //     return "PROXY $PROXY_IP:$PROXY_PORT";
    //   };
    //   //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    // };
    //   }
    // }
  }

  CancelToken _cancelToken = new CancelToken();

  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  Future<ApiResponse> get(ApiRequest request) {
    Options requestOptions = request.options ?? Options();

    requestOptions = requestOptions.copyWith(extra: {
      "refresh": request.cacheConfig.refresh,
      "noCache": request.cacheConfig.noCahce,
      "cacheKey": request.cacheConfig.cacheKey,
      "cacheDisk": request.cacheConfig.cacheDisk,
      "withSession": request.withSeesion
    });

    return dio
        .get(request.path,
            cancelToken: request.cancelToken ?? _cancelToken,
            queryParameters: request.query,
            onReceiveProgress: request.onReceiveProgress,
            options: requestOptions)
        .then(_onData, onError: _onError);
  }

  /// restful post 操作
  Future<ApiResponse> post(ApiRequest request) {
    Options requestOptions = request.options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {
      "loading": request.loading,
      "withSession": request.withSeesion
    });

    return dio
        .post(
          request.path,
          data: request.formData,
          queryParameters: request.query,
          options: requestOptions,
          cancelToken: request.cancelToken ?? _cancelToken,
          onReceiveProgress: request.onReceiveProgress,
          onSendProgress: request.onReceiveProgress,
        )
        .then(_onData, onError: _onError);
  }

  _onError(dynamic error, StackTrace s) {
    if (error is DioError) {
      error = error.error;
      if (error is BaseApiException) {
        error.onException();
        return;
      }
      if (error is UnauthorisedException) {
        SpUtil.remove(SpKey.ACCESS_SESSION);
        // SpStorage.instance.remove(SpKey.ACCESS_SESSION);
        // SpStorage.instance.remove(SpKey.HAS_LOGIN);
        // g.Get.offAllNamed(AppRoutes.login);
        return;
      }
    }

    return;
  }

  ApiResponse _onData(Response response) {
    final data = response.data;
    if (data is List) {
      return ApiResponse.fromList(data);
    }

    ///返回空字符串同样视为操作成功
    if (data is String && data.isEmpty) {
      return ApiResponse.empty();
    }
    if (data is Map) {
      return !data.containsKey("status_code") || !data.containsKey("data")
          ? ApiResponse.rawJson(data)
          : ApiResponse.fromJson(data);
      // ApiResponse.completed(data);
    }
    return ApiResponse.empty();

    // throw ApiResponse.error(DataInvalidException());
  }

  /// restful put 操作
  Future<ApiResponse> put(ApiRequest request) {
    return dio
        .put(
          request.path,
          data: request.formData,
          queryParameters: request.query,
          options: request.options,
          cancelToken: request.cancelToken ?? _cancelToken,
          onReceiveProgress: request.onReceiveProgress,
          onSendProgress: request.onReceiveProgress,
        )
        .then(_onData, onError: _onError);
  }

  /// restful patch 操作
  Future<ApiResponse> patch(ApiRequest request) {
    return dio
        .patch(
          request.path,
          data: request.formData,
          queryParameters: request.query,
          options: request.options,
          cancelToken: request.cancelToken ?? _cancelToken,
          onReceiveProgress: request.onReceiveProgress,
          onSendProgress: request.onReceiveProgress,
        )
        .then(_onData, onError: _onError);
  }

  /// restful delete 操作
  Future<ApiResponse> delete(ApiRequest request) {
    return dio
        .delete(request.path,
            data: request.formData,
            queryParameters: request.query,
            options: request.options,
            cancelToken: request.cancelToken ?? _cancelToken)
        .then(_onData, onError: _onError);
  }

  /// restful post form 表单提交操作
  Future<ApiResponse> postForm(ApiRequest request) {
    return dio
        .put(
          request.path,
          data: request.formData,
          queryParameters: request.query,
          options: request.options,
          cancelToken: request.cancelToken ?? _cancelToken,
          onReceiveProgress: request.onReceiveProgress,
          onSendProgress: request.onReceiveProgress,
        )
        .then(_onData, onError: _onError);
  }

  // Future download() {
  //   return Future.value();
  // }
}
