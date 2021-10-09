/*
 * @Description: 本地存储初始化器
 * @Author: iamsmiling
 * @Date: 2021-09-18 14:13:58
 * @LastEditTime: 2021-09-18 14:17:37
 */
import 'package:flustars/flustars.dart';
import 'package:ty_flutter_cli/config/env/app_environment.dart';
import 'base_initializer.dart';

class StorageInitializer extends BaseInitilizer {
  @override
  Future initialize(AppEnvironment env) async {
    /// 等待Sp初始化完成。
    await SpUtil.getInstance();
  }
}
