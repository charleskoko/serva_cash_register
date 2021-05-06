import 'package:serva_cash_register/data/models/article.dart';

class ListingRepository {
  List<Map<String, dynamic>> addArticleToListing(
      Article product, List<Map<String, dynamic>> listing,
      {String quantity, double price, Map<String, dynamic> article}) {
    Map<String, dynamic> newArticle;
    if (price == null) {
      price = product.price;
      int count = 0;
      int added = 0;

      if (quantity == null || quantity == '') {
        added = 1;
      } else {
        added = int.parse(quantity);
      }

      for (Map<String, dynamic> item in listing) {
        if (item['product'] == product) {
          count = item['quantity'];
        }
      }
      listing.removeWhere((item) => item['product'] == product);
      count = count + added;
      newArticle = {
        'product': product,
        'price': price,
        'quantity': count,
        'total': count * price
      };
    } else {
      listing.removeWhere((item) => item['product'] == product);
      newArticle = {
        'product': product,
        'price': price,
        'quantity': article['quantity'],
        'total': article['quantity'] * price
      };
    }

    listing.add(newArticle);
    return listing;
  }

  void localListingStorage() {}

  List<Map<String, dynamic>> removeArticleToListing(
      Article product, List<Map<String, dynamic>> listing) {
    listing.removeWhere((item) => item['product'] == product);

    return listing;
  }
}
