class Category {
  String id, name, description;

  Category(this.description, this.id, this.name);

  Category.fromJson(Map<String, dynamic>json) {
    this.name = json['name'];
    this.id = json['id'];
    this.description = json['description'];
  }
}