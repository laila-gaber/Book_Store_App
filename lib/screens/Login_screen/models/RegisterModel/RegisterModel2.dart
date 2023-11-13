import 'dart:ffi';

import 'Data.dart';

/// data : {"user":{"id":68,"name":"loz","email":"loz@gmail.com","address":null,"city":null,"phone":null,"email_verified":false,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"},"token":"318|dyszDwL6RQ7zHvJLxmY5U3Rj6VPDz7zdiknMpJWN"}
/// message : "Successfully registered! Please verify your email."
/// error : []
/// status : 201

class RegisterModel2 {
  RegisterModel2({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  RegisterModel2.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add((v));
      });
    }
    status = json['status'];
  }
  Data? data;
  String? message;
  List<String>? error;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    if (error != null) {
      map['error'] = error?.map((v) => v).toList();
    }
    map['status'] = status;
    return map;
  }

}