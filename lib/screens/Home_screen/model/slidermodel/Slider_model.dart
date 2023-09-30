import 'SliderData.dart';

/// data : {"sliders":[{"image":"https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg"},{"image":"https://codingarabic.online/storage/slider/GtwDnJtmovi7XHfCqBf3XyzejUGUo9fJ4kMpJNQ7.jpg"},{"image":"https://codingarabic.online/storage/slider/D0S7ph0nDeT3va8QssrbSp4qgwYlTxqTufoc8Vvv.jpg"}]}
/// message : ""
/// error : []
/// status : 200

class SliderModel {
  SliderModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  SliderModel.fromJson(dynamic json) {
    data = json['data'] != null ? SliderData.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add((v));
      });
    }
    status = json['status'];
  }
  SliderData? data;
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