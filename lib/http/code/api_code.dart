/*
 * @Description: api业务状态吗
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:27:12
 * @LastEditTime: 2021-09-04 16:03:14
 */
part of http;

enum ApiCode {
  ///成功
  success,

  ///系统错误
  systemError,

  ///未登录
  unlogin,

  ///无权限
  notAllowed,

  ///数据格式错误
  dataFormatError,

  ///动态验证码不可空
  verificationIdIsNull,
}

extension ApiCodeName on ApiCode {
  String get code =>
      {
        ApiCode.success: "000000",
        ApiCode.systemError: "100001",
        ApiCode.unlogin: "100002",
        ApiCode.notAllowed: "100003",
        ApiCode.dataFormatError: "200001",
        ApiCode.verificationIdIsNull: "200011"
      }[this] ??
      "";
}
