import 'package:serva_cash_register/data/models/product.dart';

class ListingRepository {
  List<Map<String, dynamic>> addArticleToListing(
      Product product, List<Map<String, dynamic>> listing) {
    Map<String, dynamic> newArticle;

    int count = 0;

    for (Map<String, dynamic> item in listing) {
      if (item['product'] == product) {
        count = item['quantity'];
      }
    }
    listing.removeWhere((item) => item['product'] == product);
    count = count + 1;
    newArticle = {
      'product': product,
      'quantity': count,
      'total': count * product.price
    };
    listing.add(newArticle);
    return listing;
  }
}
