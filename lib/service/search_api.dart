/*
 * @Description: search
 * @Author: iamsmiling
 * @Date: 2021-10-08 20:00:35
 * @LastEditTime: 2021-10-09 00:22:38
 */
import 'package:ty_flutter_cli/http/http.dart';
import 'package:ty_flutter_cli/model/search/search_item_model.dart';
import 'package:ty_flutter_cli/service/api_path.dart';

abstract class SearchAPI {
  /// 密码登录(包含手机或邮箱,name传手机或邮箱)
  static Future<List<SearchItemModel>> search(
      {required String keyword, bool noThrottling = true, Map? params}) {
    return Http.instance
        .get(ApiRequest(
          ApiPath.SEARCH,
          query: {
            "no-throttling": noThrottling,
            "search": keyword,
            ...(params ?? {})
          },
        ))
        .then((value) => value.data
            .map((e) => SearchItemModel.fromJson(e))
            .toList()
            .cast<SearchItemModel>());
  }
}
