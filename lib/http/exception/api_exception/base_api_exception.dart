/*
 * @Description: api相关的异常
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:22:11
 * @LastEditTime: 2021-09-03 14:51:45
 */
part of http;

abstract class BaseApiException extends BaseException {
  final String message;
  final String code;

  BaseApiException(this.code, this.message)
      : super(code: code, message: message);
  void onException();
}
