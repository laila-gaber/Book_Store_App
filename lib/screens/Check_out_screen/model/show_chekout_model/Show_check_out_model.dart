import 'Data.dart';

/// data : {"id":178,"user":{"user_id":242,"user_name":"hagar","user_email":"lola@gmail.com","address":"bon","phone":"010232332323"},"total":"562.70","cart_items":[{"item_id":894,"item_product_id":1,"item_product_name":"Grokking Algorithms","item_product_price":"250.00","item_quantity":1,"item_total":"125.00"},{"item_id":895,"item_product_id":2,"item_product_name":"Clean Code","item_product_price":"299.00","item_quantity":1,"item_total":"179.40"},{"item_id":898,"item_product_id":6,"item_product_name":"Head First Object-Oriented Analysis and Design","item_product_price":"369.00","item_quantity":1,"item_total":"258.30"}]}
/// message : "Checkout"
/// error : []
/// status : 200

class ShowCheckOutModel {
  ShowCheckOutModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  ShowCheckOutModel.fromJson(dynamic json) {
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