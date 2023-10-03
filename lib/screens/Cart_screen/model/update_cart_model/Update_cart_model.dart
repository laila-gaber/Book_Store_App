import 'Data.dart';

/// data : {"id":59,"user":{"user_id":204,"user_name":"laila"},"total":"2446.20","cart_items":[{"item_id":254,"item_product_id":3,"item_product_name":"Cracking the Coding Interview","item_product_image":"https://codingarabic.online/storage/product/g1187MzWBCj9Zlcd4Q4jxty4tLPOAohmx7FYeyPh.jpg","item_product_price":"399.00","item_product_discount":30,"item_product_price_after_discount":279.3,"item_product_stock":76,"item_quantity":3,"item_total":837.9000000000001},{"item_id":262,"item_product_id":2,"item_product_name":"Clean Code","item_product_image":"https://codingarabic.online/storage/product/MfwmbCtkbkP5Z1MCwTonoXFEOG8CXOrXe9SmDa7c.jpg","item_product_price":"299.00","item_product_discount":40,"item_product_price_after_discount":179.4,"item_product_stock":80,"item_quantity":2,"item_total":358.8},{"item_id":264,"item_product_id":5,"item_product_name":"Head First Design Patterns","item_product_image":"https://codingarabic.online/storage/product/6aM0EAUMO5cu0eiBOezc73pAAu2NYRlq2JrJCTN1.jpg","item_product_price":"389.00","item_product_discount":50,"item_product_price_after_discount":194.5,"item_product_stock":90,"item_quantity":2,"item_total":389},{"item_id":265,"item_product_id":6,"item_product_name":"Head First Object-Oriented Analysis and Design","item_product_image":"https://codingarabic.online/storage/product/YR56H2uH1JM5TxjRu2J6XDNEvSYObERIRdeO7hMO.jpg","item_product_price":"369.00","item_product_discount":30,"item_product_price_after_discount":258.3,"item_product_stock":95,"item_quantity":1,"item_total":258.3},{"item_id":280,"item_product_id":1,"item_product_name":"Grokking Algorithms","item_product_image":"https://codingarabic.online/storage/product/UXbY3BvoHIQCuG6DqBK1dtfSKnpH67tUjwdr6ctT.png","item_product_price":"250.00","item_product_discount":50,"item_product_price_after_discount":125,"item_product_stock":96,"item_quantity":1,"item_total":125},{"item_id":281,"item_product_id":8,"item_product_name":"atomic habits","item_product_image":"https://codingarabic.online/storage/product/cjwOaPJtZZtZux6wdvW7Rx4PEY4rjE1KQifK3y6Z.jpg","item_product_price":"239.00","item_product_discount":50,"item_product_price_after_discount":119.5,"item_product_stock":95,"item_quantity":1,"item_total":119.5},{"item_id":282,"item_product_id":12,"item_product_name":"Fundamentals of Software Architecture, An Engineering Approach","item_product_image":"https://codingarabic.online/storage/product/QMKlfPvseR6iaemqhA48sIOPEzhxaw7dvzASRHE8.jpg","item_product_price":"289.00","item_product_discount":30,"item_product_price_after_discount":202.3,"item_product_stock":98,"item_quantity":1,"item_total":202.3},{"item_id":283,"item_product_id":13,"item_product_name":"Practical Statistics for Data Scientists","item_product_image":"https://codingarabic.online/storage/product/JGQ1GLsrKZW4rEti21BdQyaZfOOHzz5oeolEA74X.jpg","item_product_price":"259.00","item_product_discount":40,"item_product_price_after_discount":155.4,"item_product_stock":99,"item_quantity":1,"item_total":155.4}]}
/// message : "Cart Updated"
/// error : []
/// status : 201

class UpdateCartModel {
  UpdateCartModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  UpdateCartModel.fromJson(dynamic json) {
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