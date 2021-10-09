/*
 * @Description: 请求错误
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:32:51
 * @LastEditTime: 2021-09-03 14:50:12
 */
/// 请求错误
part of http;

class BadRequestException extends BaseException {
  BadRequestException(String code, String message)
      : super(code: code, message: message);
}
