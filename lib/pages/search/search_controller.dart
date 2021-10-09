/*
 * @Description:搜索页面逻辑
 * @Author: iamsmiling
 * @Date: 2021-10-08 19:50:30
 * @LastEditTime: 2021-10-09 12:44:10
 */
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:ty_flutter_cli/components/base/future_loadstate_builder.dart';
import 'package:ty_flutter_cli/model/search/search_item_model.dart';
import 'package:ty_flutter_cli/service/search_api.dart';
import 'package:ty_flutter_cli/utils/toast_util.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchController
    extends BaseFutureLoadStateController<List<SearchItemModel>> {
  List<SearchItemModel> list = [];

  late TextEditingController textEditingController;

  final keyword = "".obs;
  final noThrottling = true.obs;

  List<String> historyList = [
    "Mock",
    "Language",
    "Dart",
    "Vue",
    "Flutter",
    "Build"
  ];
  @override
  Future<List<SearchItemModel>> loadData({Map? params}) {
    return SearchAPI.search(
            keyword: keyword.value, noThrottling: noThrottling.value)
        .then((value) {
      list = value;
      return value;
    });
  }

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }

  void onTagTap(String s) {
    ///mock false

    if (s == keyword.value) return;
    textEditingController.text = s;
    keyword.value = s;

    update();
    fetch();
  }

  void onClear() {
    keyword.value = "";

    fetch();
  }

  void onChanged(String s) {
    keyword.value = s;
    debounce(keyword, (callback) => fetch(),
        time: const Duration(milliseconds: 500));
  }

  void onItemTap(SearchItemModel item) async {
    await canLaunch(item.url)
        ? await launch(item.url)
        : ToastUtil.error("could not open the url");
  }
}
