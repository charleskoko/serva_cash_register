import 'package:serva_cash_register/data/models/product.dart';

class Utility {
  static totalNet(List<Map<String, dynamic>> listing) {
    double sum = 0;
    if (listing.length != 0) {
      for (Map<String, dynamic> item in listing) {
        sum += item['total'];
      }
    }
    return sum;
  }

  static grossTotal(double totalNet) {
    double sum = 0;
    if (totalNet != 0) {
      sum = totalNet + (totalNet * 16) / 100;
    }
    return sum;
  }

  static selectedArticle(Product product, List<Map<String, dynamic>> listing) {
    int sum = 0;
    for (Map<String, dynamic> item in listing) {
      if (product == item['product']) {
        sum = item['quantity'];
      }
    }

    return sum;
  }
}
