import 'category.dart';

class Product{
  String id, label, description, imageUrl;
  double price;
  Category category;

  Product(this.description, this.id, this.label, this.price, this.imageUrl);

  Product.fromJson(Map<String, dynamic>json) {
    this.label = json['label'];
   this.imageUrl = null;
    this.id = json['id'];
    this.price = json['price'].toDouble();
    this.description = json['description'];
    this.category = Category.fromJson(json['category']);
  }
}