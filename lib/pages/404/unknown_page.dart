/*
 * @Description: 404页面
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:03:49
 * @LastEditTime: 2021-09-18 15:06:38
 */
import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404页面"),
      ),
    );
  }
}
