import 'package:serva_cash_register/data/models/list_item.dart';
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

  static checkCash(String cash, double total) {
    bool isCashEnough = false;
    double convertedCash;
    if (cash != 'c' && cash != 'delete') {
      convertedCash = double.parse(cash);
      if (convertedCash - total > 0) {
        isCashEnough = true;
      }
    }

    return isCashEnough;
  }

  static change(double total, Map<String, dynamic> paymentMethod) {
    String change = 'Rien à rendre';

    if (paymentMethod['paymentMethod'] == 'cash') {
      double cashToDouble = double.parse(paymentMethod['value']);
      change = (cashToDouble - total).toStringAsFixed(2) + ' XOF';
    }

    return change;
  }

  static bill(List<Map<String, dynamic>> listing,
      Map<String, dynamic> paymentMethodInfo) {
    List<ListItem> items = [];
    HeadingItem article = HeadingItem('articles');
    HeadingItem total = HeadingItem('Total');
    items.add(article);
    for (Map<String, dynamic> element in listing) {
      items.add(ArticleItem(element));
    }
    items.add(total);
    double sum = grossTotal(totalNet(listing));
    TotalItem totalItem = TotalItem(sum);
    items.add(totalItem);
    HeadingItem paymentMethod = HeadingItem('mode de paiement');
    items.add(paymentMethod);
    PaymentMethodItem paymentMethodItem =
        PaymentMethodItem(paymentMethodInfo, grossTotal(totalNet(listing)));
    items.add(paymentMethodItem);

    return items;
  }
}
