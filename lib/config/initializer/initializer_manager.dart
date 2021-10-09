/*
 * @Description: 初始化管理统一初始化
 * @Author: iamsmiling
 * @Date: 2021-09-18 14:20:45
 * @LastEditTime: 2021-09-22 15:20:21
 */
import 'package:ty_flutter_cli/config/env/app_environment.dart';
import 'package:ty_flutter_cli/config/initializer/base/device_initializer.dart';

import '../app_config.dart';
import 'base/base_initializer.dart';
import 'base/debugger_initializer.dart';
import 'base/logger_intilaizer.dart';
import 'base/storage_initializer.dart';
import 'base/system_initializer.dart';

abstract class InitializerManager<T extends BaseInitilizer> {
  static List<BaseInitilizer> _initializers = [
    ///SpStorage需要最先初始化
    StorageInitializer(),
    SystemInitializer(),

    ///是否允许打印
    LoggerInitializer(),
    DebuggerInitializer(),
    DeviceInitializer(),
  ];

  ///进行统一初始化
  static Future initialize(AppEnvironment env) async {
    AppConfig.environment = env;
    for (BaseInitilizer i in _initializers) {
      await i.initialize(env);
    }
  }
}
