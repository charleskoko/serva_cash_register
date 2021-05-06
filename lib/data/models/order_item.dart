import 'package:equatable/equatable.dart';

import 'article.dart';
import 'category.dart';

class OrderItem extends Equatable {
  String productId;
  Article article;
  double price;
  int quantity;

  OrderItem(this.productId, this.article, this.price, this.quantity);

  OrderItem.fromJson(Map<String, dynamic> json) {
    this.productId = json['productId'];
    this.article = Article.fromJson(json['article']);
    this.price = json['price'];
    this.quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'article': article.toJson(),
        'price': price,
        'quantity': quantity
      };

  @override
  List<Object> get props => [productId, article, price, quantity];
}
