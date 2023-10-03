// To parse this JSON data, do
//
//     final showFav2Model = showFav2ModelFromJson(jsonString);

import 'dart:convert';

ShowFav2Model showFav2ModelFromJson(String str) => ShowFav2Model.fromJson(json.decode(str));

String showFav2ModelToJson(ShowFav2Model data) => json.encode(data.toJson());

class ShowFav2Model {
  Data data;
  String message;
  List<dynamic> error;
  int status;

  ShowFav2Model({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory ShowFav2Model.fromJson(Map<String, dynamic> json) => ShowFav2Model(
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
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int id;
  String name;
  String price;
  String category;
  String image;
  int discount;
  int stock;
  String description;
  int bestSeller;

  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.discount,
    required this.stock,
    required this.description,
    required this.bestSeller,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    category: json["category"],
    image: json["image"],
    discount: json["discount"],
    stock: json["stock"],
    description: json["description"],
    bestSeller: json["best_seller"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "category": category,
    "image": image,
    "discount": discount,
    "stock": stock,
    "description": description,
    "best_seller": bestSeller,
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
