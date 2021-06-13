import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'article.dart';

class OrderItem extends Equatable {
  String id;
  String articleId;
  Article article;
  String name;
  double price;
  int quantity;

  OrderItem(this.articleId, this.name, this.article, this.price, this.quantity);

  OrderItem.fromJson(Map<String, dynamic> json) {
    this.articleId = json['productId'];
    this.name = json['name'];
    this.id = json['id'];
    if (json['article'] != null) {
      this.article = Article.fromJson(json['article']);
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
