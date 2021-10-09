/*
 * @Description: 太一脉国际化处理
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:56:13
 * @LastEditTime: 2021-09-18 15:58:39
 */
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'logged_in': 'logged in as @name with email @email',
        },
        'de_DE': {
          'hello': 'Hallo Welt',
        }
      };
}
