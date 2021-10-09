/*
 * @Description: 数据非法
 * @Author: iamsmiling
 * @Date: 2021-09-04 09:30:04
 * @LastEditTime: 2021-09-04 09:32:16
 */

part of http;

class DataInvalidException extends BaseApiException {
  DataInvalidException({String code = "", String message = "服务端返回数据异常"})
      : super(code, message);

  @override
  void onException() {
    print("服务端返回数据异常");
  }
}
