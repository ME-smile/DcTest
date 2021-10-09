/*
 * @Description: 首页页面ui
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:12:08
 * @LastEditTime: 2021-09-18 15:22:33
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ty_flutter_cli/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: GetBuilder(
        builder: (HomeController _) {
          return Text("$_");
        },
      ),
    );
  }
}
