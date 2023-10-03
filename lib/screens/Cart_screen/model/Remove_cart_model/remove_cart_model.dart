// To parse this JSON data, do
//
//     final removeCartModel = removeCartModelFromJson(jsonString);

import 'dart:convert';

RemoveCartModel removeCartModelFromJson(String str) => RemoveCartModel.fromJson(json.decode(str));

String removeCartModelToJson(RemoveCartModel data) => json.encode(data.toJson());

class RemoveCartModel {
  Data data;
  String message;
  List<dynamic> error;
  int status;

  RemoveCartModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory RemoveCartModel.fromJson(Map<String, dynamic> json) => RemoveCartModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    error: List<dynamic>.from(json["error"].map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "error": List<dynamic>.from(error.map((x) => x)),
    "status": status,
  };
}

class Data {
  int id;
  User user;
  double total;
  List<CartItem> cartItems;

  Data({
    required this.id,
    required this.user,
    required this.total,
    required this.cartItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    user: User.fromJson(json["user"]),
    total: json["total"]?.toDouble(),
    cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "total": total,
    "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
  };
}

class CartItem {
  int itemId;
  int itemProductId;
  String itemProductName;
  String itemProductImage;
  String itemProductPrice;
  int itemProductDiscount;
  double itemProductPriceAfterDiscount;
  int itemProductStock;
  int itemQuantity;
  double itemTotal;

  CartItem({
    required this.itemId,
    required this.itemProductId,
    required this.itemProductName,
    required this.itemProductImage,
    required this.itemProductPrice,
    required this.itemProductDiscount,
    required this.itemProductPriceAfterDiscount,
    required this.itemProductStock,
    required this.itemQuantity,
    required this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    itemId: json["item_id"],
    itemProductId: json["item_product_id"],
    itemProductName: json["item_product_name"],
    itemProductImage: json["item_product_image"],
    itemProductPrice: json["item_product_price"],
    itemProductDiscount: json["item_product_discount"],
    itemProductPriceAfterDiscount: json["item_product_price_after_discount"]?.toDouble(),
    itemProductStock: json["item_product_stock"],
    itemQuantity: json["item_quantity"],
    itemTotal: json["item_total"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_product_id": itemProductId,
    "item_product_name": itemProductName,
    "item_product_image": itemProductImage,
    "item_product_price": itemProductPrice,
    "item_product_discount": itemProductDiscount,
    "item_product_price_after_discount": itemProductPriceAfterDiscount,
    "item_product_stock": itemProductStock,
    "item_quantity": itemQuantity,
    "item_total": itemTotal,
  };
}

class User {
  int userId;
  String userName;

  User({
    required this.userId,
    required this.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_name": userName,
  };
}
