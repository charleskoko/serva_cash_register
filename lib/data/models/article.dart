import 'package:equatable/equatable.dart';

import 'category.dart';

class Article extends Equatable {
  String id, label, description, number;
  double price;
  Category category;

  Article(this.id, this.description, this.label, this.number, this.price,
      this.category);

  Article.fromJson(Map<String, dynamic> json) {
    this.label = json['label'];
    this.id = json['id'];
    this.number = json['number'];
    this.price = json['price'].toDouble();
    this.description = json['description'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'description': description,
        'number': number,
        'price': price,
      };

  @override
  List<Object> get props => [id, label, description, number, price];
}
