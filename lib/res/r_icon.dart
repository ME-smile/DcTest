/*
 * @Description: 图标
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:01:04
 * @LastEditTime: 2021-10-08 21:09:14
 */
part of r;

class _RIcon {
  static _RIcon _singleton = _RIcon._();
  // ignore: unused_element
  _RIcon._();
  factory _RIcon() => _singleton;

  final String inputClear = "assets/images/input_clear.png";

  final String empty = "assets/images/empty.png";

  final String jump = "assets/images/jump.png";

  final String netError = "assets/images/net_error.png";

  final String search = "assets/images/search.png";
}
