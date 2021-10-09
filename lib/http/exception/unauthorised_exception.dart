/*
 * @Description: 未认证错误
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:35:59
 * @LastEditTime: 2021-09-03 14:47:11
 */
part of http;

class UnauthorisedException extends BaseException {
  UnauthorisedException(String code, String message)
      : super(code: code, message: message);
}
