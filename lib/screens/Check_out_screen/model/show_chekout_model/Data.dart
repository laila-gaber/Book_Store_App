import 'User.dart';
import 'CartItems.dart';

/// id : 178
/// user : {"user_id":242,"user_name":"hagar","user_email":"lola@gmail.com","address":"bon","phone":"010232332323"}
/// total : "562.70"
/// cart_items : [{"item_id":894,"item_product_id":1,"item_product_name":"Grokking Algorithms","item_product_price":"250.00","item_quantity":1,"item_total":"125.00"},{"item_id":895,"item_product_id":2,"item_product_name":"Clean Code","item_product_price":"299.00","item_quantity":1,"item_total":"179.40"},{"item_id":898,"item_product_id":6,"item_product_name":"Head First Object-Oriented Analysis and Design","item_product_price":"369.00","item_quantity":1,"item_total":"258.30"}]

class Data {
  Data({
      this.id, 
      this.user, 
      this.total, 
      this.cartItems,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    total = json['total'];
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
  }
  num? id;
  User? user;
  String? total;
  List<CartItems>? cartItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['total'] = total;
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}