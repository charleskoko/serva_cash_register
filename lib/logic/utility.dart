import 'package:serva_cash_register/data/models/product.dart';

List<double> money = [50, 100, 200, 500, 1000, 2000, 5000, 10000];

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
      sum = totalNet + ((totalNet * 18) / 100);
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
