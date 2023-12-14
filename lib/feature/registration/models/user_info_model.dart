class UserInfoModel {
  String? id;
  String? name;
  String? username;
  String? getAvatar;

  UserInfoModel({this.id, this.name, this.username, this.getAvatar});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    getAvatar = json['get_avater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['get_avatar'] = getAvatar;
    return data;
  }
}
