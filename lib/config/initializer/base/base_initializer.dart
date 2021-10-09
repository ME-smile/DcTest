/*
 * @Description: app初始化器的基类
 * @Author: iamsmiling
 * @Date: 2021-09-18 11:02:17
 * @LastEditTime: 2021-09-18 11:02:17
 */

import 'package:ty_flutter_cli/config/env/app_environment.dart';

abstract class BaseInitilizer {
  Future initialize(AppEnvironment env);
}
