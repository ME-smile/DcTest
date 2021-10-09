/*
 * @Description:  未登录异常
 * @Author: iamsmiling
 * @Date: 2021-09-03 14:59:50
 * @LastEditTime: 2021-09-18 15:38:27
 */
part of http;

class UnloginException extends BaseApiException {
  UnloginException(String code, String message) : super(code, message);

  @override
  void onException() {
    print("去登录");
    // SpStorage.instance.remove(SpKey.ACCESS_SESSION);
    // SpStorage.instance.remove(SpKey.HAS_LOGIN);
    g.Get.offAllNamed(AppRoutes.login);
  }
}
