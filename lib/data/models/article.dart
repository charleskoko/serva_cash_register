import 'package:equatable/equatable.dart';

import 'category.dart';

class Article extends Equatable {
  String id, label, description, number, imageUrl;
  double price;
  Category category;

  Article(this.id, this.description, this.label, this.number, this.price,
      this.category, this.imageUrl);

  Article.fromJson(Map<String, dynamic> json) {
    this.label = json['label'];
    this.imageUrl = null;
    this.id = json['id'];
    this.number = json['number'];
    this.price = json['price'].toDouble();
    this.description = json['description'];
    //this.category =(json['category'] == null) ? null : Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'description': description,
        'number': number,
        'price': price,
        //'categoryId': (category != null) ? category.id : null
      };

  @override
  List<Object> get props =>
      [id, label, description, imageUrl, number, price];
}
