/*
 * @Description: 用户session相关模型
 * @Author: iamsmiling
 * @Date: 2021-09-18 15:42:17
 * @LastEditTime: 2021-09-18 15:43:21
 */
class UserSessionModel {
  String? accessSession;
  String? gender;
  String? name;
  String? nickName;
  String? portraitUrl;
  List<int>? roles;
  List<String>? permissions;
  String? uid;

  bool get canLogin => roles.toString() == [10].toString();

  UserSessionModel.fromJson(Map<String, dynamic> json) {
    accessSession = json['access_session'];
    gender = json['gender'];
    name = json['name'];
    nickName = json['nickName'];
    portraitUrl = json['portraitUrl'];
    roles = json['roles'].cast<int>();
    permissions = json['permissions'].cast<String>();
    uid = "${json['uid']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_session'] = this.accessSession;
    data['gender'] = this.gender;
    data['name'] = this.name;
    data['nickName'] = this.nickName;
    data['portraitUrl'] = this.portraitUrl;
    data['roles'] = this.roles;
    data['permissions'] = this.permissions;
    data['uid'] = this.uid;
    return data;
  }
}
