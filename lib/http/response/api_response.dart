/*
 * @Description:app请求结果返回
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:19:00
 * @LastEditTime: 2021-10-08 20:22:27
 */

part of http;

enum ApiStatus { COMPLETED, ERROR }

/// 基本返回数据模型
class ApiResponseEntity<T> {
  String statusCode = "";
  String message = "";
  late T data;
  ApiResponseEntity.fromJson(Map json) {
    statusCode = json["status_code"];
    message = json["msg"];
    data = json["data"];
  }
}

class ApiResponse {
  ApiStatus status = ApiStatus.COMPLETED;
  BaseApiException? exception;

  String statusCode = "";
  String message = "";
  dynamic data;
  ApiResponse.completed(this.data) : status = ApiStatus.COMPLETED;
  ApiResponse.error(this.exception);

  ApiResponse.fromJson(Map json) {
    status = ApiStatus.COMPLETED;
    statusCode = json["status_code"] ?? "";
    message = json["msg"] ?? "";
    data = json["data"];
  }

  ApiResponse.rawJson(Map json) {
    data = json;
  }

  ApiResponse.fromList(List list) {
    data = list;
  }

  ApiResponse.empty() : status = ApiStatus.COMPLETED;

  @override
  String toString() {
    return "Status : $status \n Message : $exception \n Data : $data";
  }
}
