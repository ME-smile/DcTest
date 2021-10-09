/*
 * @Description: 日志打印初始化器
 * @Author: iamsmiling
 * @Date: 2021-09-18 14:24:28
 * @LastEditTime: 2021-09-18 14:27:06
 */
import 'package:flutter/foundation.dart';
import 'package:ty_flutter_cli/config/env/app_environment.dart';
import 'package:flustars/flustars.dart';
import 'base_initializer.dart';

class LoggerInitializer extends BaseInitilizer {
  @override
  Future initialize(AppEnvironment env) async {
    LogUtil.init(tag: "TY", isDebug: kDebugMode, maxLen: 9999);
  }
}
