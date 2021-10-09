/*
 * @Description: 搜索结果模型
 * @Author: iamsmiling
 * @Date: 2021-10-08 20:06:10
 * @LastEditTime: 2021-10-08 20:08:37
 */
class SearchItemModel {
  late String title;
  late String description;
  late String image;
  late String url;
  late String category;

  SearchItemModel.fromJson(Map json) {
    title = json["title"];
    description = json["description"];
    image = json["image"];
    url = json["url"];
    category = json["category"];
  }
}
