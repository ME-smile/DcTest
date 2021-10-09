/*
 * @Description: app包信息、手机系统等
 * @Author: iamsmiling
 * @Date: 2021-09-18 16:56:57
 * @LastEditTime: 2021-09-18 17:01:18
 */

// e.g. "iPod7,1"
import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:ty_flutter_cli/config/app_config.dart';
import 'package:ty_flutter_cli/config/env/app_environment.dart';

import 'base_initializer.dart';

class DeviceInitializer extends BaseInitilizer {
  @override
  Future initialize(AppEnvironment env) async {
    AppConfig.packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    if (GetPlatform.isAndroid) {
      AppConfig.androidInfo = await deviceInfo.androidInfo;
    }
    if (GetPlatform.isIOS) {
      AppConfig.iosInfo = await deviceInfo.iosInfo;
    }
  }
}
