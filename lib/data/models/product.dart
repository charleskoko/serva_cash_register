import 'category.dart';

class Product{
  String id, label, description;
  int price;
  //Category category;

  Product(this.description, this.id, this.label, this.price);

  Product.fromJson(Map<String, dynamic>json) {
    this.label = json['title'];
    this.id = json['id'];
    this.price = json['id'];
    this.description = json['body'];
    //this.category = Category.fromJson(json['category']);
  }
}