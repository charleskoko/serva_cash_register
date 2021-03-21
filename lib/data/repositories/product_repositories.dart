import 'package:serva_cash_register/data/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class ProductRepository {
  static const BaseUrl = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Product>> fecthProduct() async {
    await http.get(BaseUrl);
    final result = await http.get(BaseUrl, headers:setHeader());
    Map<String, dynamic> body = json.decode(result.body);
    final List<dynamic> list =  body['data'];
    return list.map((json) =>Product.fromJson(json)).toList();
  }
}

setHeader() => {
  'Content-type':'application/json',
  'Accept':'application/json'
};