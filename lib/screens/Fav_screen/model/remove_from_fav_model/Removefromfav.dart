import 'Data.dart';
/// data : {"current_page":1,"data":[{"id":1,"name":"Grokking Algorithms","price":"250.00","category":"Software","image":"https://codingarabic.online/storage/product/UXbY3BvoHIQCuG6DqBK1dtfSKnpH67tUjwdr6ctT.png","discount":50,"stock":96,"description":"<p>Grokking Algorithms is a fully illustrated, friendly guide that teaches you how to apply common algorithms to the practical problems you face every day as a programmer. You’ll start with sorting and searching and, as you build up your skills in thinking algorithmically, you’ll tackle more complex concerns such as data compression and artificial intelligence. Each carefully presented example includes helpful diagrams and fully annotated code samples in Python. Learning about algorithms doesn’t have to be boring! Get a sneak peek at the fun, illustrated, and friendly examples you’ll find in Grokking Algorithms on Manning Publications’ YouTube channel. Continue your journey into the world of algorithms with Algorithms in Motion, a practical, hands-on video course available exclusively at Manning.com (www.manning.com/livevideo/algorithms-​in-motion).</p>","best_seller":4}],"first_page_url":"https://codingarabic.online/api/remove-from-wishlist?page=1","from":1,"last_page":1,"last_page_url":"https://codingarabic.online/api/remove-from-wishlist?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"https://codingarabic.online/api/remove-from-wishlist?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"https://codingarabic.online/api/remove-from-wishlist","per_page":15,"prev_page_url":null,"to":1,"total":1}
/// message : "Not Found"
/// error : []
/// status : 404

class Removefromfavmodel {
  Removefromfavmodel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  Removefromfavmodel.fromJson(dynamic json) {
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