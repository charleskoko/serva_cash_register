import 'package:equatable/equatable.dart';

import 'category.dart';

class Product extends Equatable {
  String id, label, description, imageUrl;
  double price;
  Category category;

  Product(this.description, this.id, this.label, this.price, this.imageUrl);

  Product.fromJson(Map<String, dynamic> json) {
    this.label = json['label'];
    this.imageUrl = null;
    this.id = json['id'];
    this.price = json['price'].toDouble();
    this.description = json['description'];
    this.category = Category.fromJson(json['category']);
  }

  @override
  List<Object> get props => [id, label, description, imageUrl, price, category];
}
