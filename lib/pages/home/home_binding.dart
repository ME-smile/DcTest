/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:18:19
 * @LastEditTime: 2021-09-18 15:19:55
 */
import 'package:get/get.dart';
import 'package:ty_flutter_cli/pages/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
