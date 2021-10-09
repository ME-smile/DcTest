/*
 * @Description: 生产版本
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:51:09
 * @LastEditTime: 2021-09-18 15:51:09
 */
import 'package:ty_flutter_cli/sanbox.dart';

import 'config/env/app_environment.dart';

void main() {
  sandbox(AppEnvironment.product);
}
