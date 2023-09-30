import 'Data.dart';

/// data : {"categories":[{"id":2,"name":"Software","products_count":29},{"id":3,"name":"DevOps","products_count":10},{"id":4,"name":"AI & Data Science","products_count":10}],"meta":{"total":3,"per_page":15,"current_page":1,"last_page":1},"links":{"first":"https://codingarabic.online/api/categories?page=1","last":"https://codingarabic.online/api/categories?page=1","prev":null,"next":null}}
/// message : ""
/// error : []
/// status : 200

class CategoriesModel {
  CategoriesModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  CategoriesModel.fromJson(dynamic json) {
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