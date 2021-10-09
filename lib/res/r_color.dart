/*
 * @Description: 颜色相关
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:00:13
 * @LastEditTime: 2021-10-09 11:42:47
 */
part of r;

class _RColor {
  static _RColor _singleton = _RColor._();
  // ignore: unused_element
  _RColor._();
  factory _RColor() => _singleton;

  final Color primary = const Color(0xFF6833FF);
  final Color primaryDark = const Color(0xFF5626DF);
  final Color error = const Color(0xFFED2E7E);
  final Color transparent = Colors.transparent;
  final Color title = Colors.black;
  final Color bodyText = const Color(0xFF999FAA);
  final Color button = const Color(0xFFF2F4F8);
  final Color divider = const Color(0xFFEDF2F7);
  final Color hightlightText = const Color(0xFFF2F4F8);
  final Color hightlightButton = const Color(0xFF5626DF);
  final Color progressIndicator = const Color(0xFFEDF2F7);
}
