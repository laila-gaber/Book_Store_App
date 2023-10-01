import 'Data.dart';

/// data : {"id":204,"name":"user","email":"lozaa@gmail.com","address":"saeed","city":"tanta","phone":"0152","email_verified":true,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"}
/// message : "Profile Updated Successfully"
/// error : []
/// status : 200

class EditProfilemodel {
  EditProfilemodel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  EditProfilemodel.fromJson(dynamic json) {
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