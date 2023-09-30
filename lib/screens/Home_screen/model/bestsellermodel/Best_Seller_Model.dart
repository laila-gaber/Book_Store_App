import 'ProductData.dart';

/// data : {"products":[{"id":49,"name":"Data Science from Scratch.2","description":"<p>To really learn data science, you should not only master the tools—data science libraries, frameworks, modules, and toolkits—but also understand the ideas and principles underlying them. Updated for Python 3.6, this second edition of Data Science from Scratch shows you how these tools and algorithms work by implementing them from scratch.</p>","price":"279.00","discount":50,"price_after_discount":139.5,"stock":84,"best_seller":16,"image":"https://codingarabic.online/storage/product/5CUVpDxJU33HCGJhta9DHQnPtht5NJF7j1C7CyHk.jpg","category":"AI & Data Science"},{"id":2,"name":"Clean Code","description":"<p>ven bad code can function. But if code isn’t clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. But it doesn’t have to be that way.</p>","price":"299.00","discount":40,"price_after_discount":179.4,"stock":85,"best_seller":15,"image":"https://codingarabic.online/storage/product/MfwmbCtkbkP5Z1MCwTonoXFEOG8CXOrXe9SmDa7c.jpg","category":"Software"},{"id":3,"name":"Cracking the Coding Interview","description":"<p>I am not a recruiter. I am a software engineer. And as such, I know what it’s like to be asked to whip up brilliant algorithms on the spot and then write flawless code on a whiteboard. I’ve been through this as a candidate and as an interviewer. Cracking the Coding Interview, 6th Edition is here to help you through this process, teaching you what you need to know and enabling you to perform at your very best. I’ve coached and interviewed hundreds of software engineers. The result is this book. Learn how to uncover the hints and hidden details in a question, discover how to break down a problem into manageable chunks, develop techniques to unstick yourself when stuck, learn (or re-learn) core computer science concepts, and practice on 189 interview questions and solutions.</p>","price":"399.00","discount":30,"price_after_discount":279.3,"stock":86,"best_seller":14,"image":"https://codingarabic.online/storage/product/g1187MzWBCj9Zlcd4Q4jxty4tLPOAohmx7FYeyPh.jpg","category":"Software"},{"id":5,"name":"Head First Design Patterns","description":"<p>You know you don’t want to reinvent the wheel, so you look to Design Patterns: the lessons learned by those who’ve faced the same software design problems. With Design Patterns, you get to take advantage of the best practices and experience of others so you can spend your time on something more challenging. Something more fun. This book shows you the patterns that matter, when to use them and why, how to apply them to your own designs, and the object-oriented design principles on which they’re based. Join hundreds of thousands of developers who’ve improved their object-oriented design skills through Head First Design Patterns.</p>","price":"389.00","discount":50,"price_after_discount":194.5,"stock":90,"best_seller":10,"image":"https://codingarabic.online/storage/product/6aM0EAUMO5cu0eiBOezc73pAAu2NYRlq2JrJCTN1.jpg","category":"Software"},{"id":4,"name":"Designing Data-Intensive Applications","description":"<p>In this practical and comprehensive guide, author Martin Kleppmann helps you navigate this diverse landscape by examining the pros and cons of various technologies for processing and storing data. Software keeps changing, but the fundamental principles remain the same. With this book, software engineers and architects will learn how to apply those ideas in practice, and how to make full use of data in modern applications.</p>","price":"359.00","discount":30,"price_after_discount":251.3,"stock":94,"best_seller":6,"image":"https://codingarabic.online/storage/product/DPHZ45awJVTD1pHO2q9vIt1pf2pfBUb916anfQzL.jpg","category":"Software"},{"id":9,"name":"Algorithms Unplugged","description":"<p>Algorithms specify the way computers process information and how they execute tasks. Many recent technological innovations and achievements rely on algorithmic ideas – they facilitate new applications in science, medicine, production, logistics, traffic, communi¬cation and entertainment. Efficient algorithms not only enable your personal computer to execute the newest generation of games with features unimaginable only a few years ago, they are also key to several recent scientific breakthroughs – for example, the sequencing of the human genome would not have been possible without the invention of new algorithmic ideas that speed up computations by several orders of magnitude.</p>","price":"279.00","discount":30,"price_after_discount":195.3,"stock":94,"best_seller":6,"image":"https://codingarabic.online/storage/product/lDk8FTWhZIPdM7Wz8TiHC8KFLuCDzJAqTk8WNRsF.jpg","category":"Software"}]}
/// message : ""
/// error : []
/// status : 200

class BestSellerModel {
  BestSellerModel({
      this.data, 
      this.message, 
      this.error, 
      this.status,});

  BestSellerModel.fromJson(dynamic json) {
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