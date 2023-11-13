import 'User.dart';

/// user : {"id":68,"name":"loz","email":"loz@gmail.com","address":null,"city":null,"phone":null,"email_verified":false,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"}
/// token : "318|dyszDwL6RQ7zHvJLxmY5U3Rj6VPDz7zdiknMpJWN"

class Data {
  Data({
      this.user, 
      this.token,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}