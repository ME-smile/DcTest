/*
 * @Description: 测试环境
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:51:45
 * @LastEditTime: 2021-09-18 15:51:46
 */
import 'package:ty_flutter_cli/sanbox.dart';

import 'config/env/app_environment.dart';

void main() {
  sandbox(AppEnvironment.test);
}
