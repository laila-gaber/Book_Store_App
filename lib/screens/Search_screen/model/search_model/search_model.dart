// To parse this JSON data, do
//
//     final searchProduct = searchProductFromJson(jsonString);

import 'dart:convert';

SearchProductModel searchProductFromJson(String str) => SearchProductModel.fromJson(json.decode(str));

String searchProductToJson(SearchProductModel data) => json.encode(data.toJson());

class SearchProductModel {
  Data data;
  String message;
  List<dynamic> error;
  num status;

  SearchProductModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
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
  List<Product> products;
  Meta meta;
  Links links;

  Data({
    required this.products,
    required this.meta,
    required this.links,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "meta": meta.toJson(),
    "links": links.toJson(),
  };
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  num total;
  num perPage;
  num currentPage;
  num lastPage;

  Meta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    lastPage: json["last_page"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "per_page": perPage,
    "current_page": currentPage,
    "last_page": lastPage,
  };
}

class Product {
  num id;
  String name;
  String description;
  String price;
  num discount;
  num priceAfterDiscount;
  num stock;
  num bestSeller;
  String image;
  String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.bestSeller,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    discount: json["discount"],
    priceAfterDiscount: json["price_after_discount"],
    stock: json["stock"],
    bestSeller: json["best_seller"],
    image: json["image"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "discount": discount,
    "price_after_discount": priceAfterDiscount,
    "stock": stock,
    "best_seller": bestSeller,
    "image": image,
    "category": category,
  };
}
