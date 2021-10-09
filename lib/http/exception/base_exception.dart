/*
 * @Description: Dio异常
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:54:21
 * @LastEditTime: 2021-09-04 13:08:23
 */
part of http;

abstract class BaseException {
  final String message;
  final String code;

  BaseException({required this.code, required this.message});

  factory BaseException.create(DioError error) {
    Response? response = error.response;

    if (response == null) {
      return BadRequestException("", "无法连接服务器");
    }
    String code = "${response.statusCode}";
    switch (error.type) {
      case DioErrorType.cancel:
        {
          throw BadRequestException(code, "请求取消");
        }
      case DioErrorType.connectTimeout:
        {
          throw BadRequestException(code, "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          throw BadRequestException(code, "请求超时");
        }

      case DioErrorType.receiveTimeout:
        {
          throw BadRequestException(code, "响应超时");
        }
      case DioErrorType.response:
        {
          try {
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (code) {
              case "400":
                {
                  throw BadRequestException(code, "请求语法错误");
                }

              case "401":
                {
                  throw UnauthorisedException(code, "没有权限");
                }

              case "403":
                {
                  throw UnauthorisedException(code, "服务器拒绝执行");
                }

              case "404":
                {
                  throw UnauthorisedException(code, "无法连接服务器");
                }

              case "405":
                {
                  throw UnauthorisedException(code, "请求方法被禁止");
                }

              case "500":
                {
                  throw UnauthorisedException(code, "服务器内部错误");
                }

              case "502":
                {
                  throw UnauthorisedException(code, "无效的请求");
                }

              case "503":
                {
                  throw UnauthorisedException(code, "服务器挂了");
                }

              case "505":
                {
                  throw UnauthorisedException(code, "不支持HTTP协议请求");
                }

              default:
                {
                  throw UnkonwException(code, "未知的http异常");
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  // return AppException(
                  //     errCode, error.response?.statusMessage ?? '');
                }
            }
          } on Exception catch (exception) {
            // return error.error;
            throw exception;
          }
        }

      default:
        {
          throw error.error;
        }
    }
  }
}
