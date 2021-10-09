/*
 * @Description: app配置
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:53:52
 * @LastEditTime: 2021-09-22 10:03:43
 */

import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import 'env/app_environment.dart';

abstract class AppConfig {
  static AppEnvironment environment = AppEnvironment.develop;

  static const String environmentKey = "APP_ENV";

  // // 环境value
  // static const String debug = "debug";
  // static const String release = "release";
  // static const String test = "test";

  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;

  static PackageInfo? packageInfo;

  static String? get systemVersion {
    if (GetPlatform.isAndroid) {
      return androidInfo?.version.codename;
    }
    return iosInfo?.systemVersion;
  }
}
