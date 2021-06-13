import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'article.dart';

class OrderItemLocal extends Equatable {
  int id;
  String articleId;
  Article article;
  String name;
  double price;
  int quantity;

  OrderItemLocal(
      this.articleId, this.name, this.article, this.price, this.quantity);

  OrderItemLocal.fromJson(Map<String, dynamic> json) {
    this.articleId = json['productId'];
    this.name = json['name'];
    this.id = json['id'];
    if (json['article'] != null) {
      this.article = Article.fromJson(jsonDecode(json['article']));
    }
    this.price = json['price'].toDouble();
    this.quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() => {
        'articleId': articleId,
        'article': jsonEncode(article.toJson()),
        'name': name,
        'price': price,
        'quantity': quantity
      };

  @override
  List<Object> get props => [id, articleId, name, article, price, quantity];
}
