import 'package:equatable/equatable.dart';

class Category extends Equatable {
  String id, name, description;

  Category(this.description, this.id, this.name);

  Category.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.id = json['id'];
    this.description = json['description'];
  }

  @override
  List<Object> get props => [id, name, description];
}
