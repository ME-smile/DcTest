/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-10-08 19:50:51
 * @LastEditTime: 2021-10-08 23:31:30
 */
import 'package:get/get.dart';
import 'package:ty_flutter_cli/pages/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
