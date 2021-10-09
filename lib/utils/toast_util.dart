/*
 * @Description: 弹窗
 * @Author: iamsmiling
 * @Date: 2021-09-18 14:52:54
 * @LastEditTime: 2021-09-18 14:54:06
 */
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class ToastUtil {
  static Future<void> loading({String message = "加载中"}) {
    return EasyLoading.show(status: message);
  }

  static Future<void> warning(
    String message, {
    Duration? duration,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showInfo(message,
        duration: duration, maskType: maskType, dismissOnTap: dismissOnTap);
  }

  static Future<void> error(
    String message, {
    Duration? duration,
    EasyLoadingMaskType? maskType,
    bool? dismissOnTap,
  }) {
    return EasyLoading.showError(message,
        duration: duration, maskType: maskType, dismissOnTap: dismissOnTap);
  }

  static Future<void> dismiss() {
    return EasyLoading.dismiss();
  }

  static init() {
    return EasyLoading.init();
  }
}
