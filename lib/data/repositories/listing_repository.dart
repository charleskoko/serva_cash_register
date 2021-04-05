import 'package:serva_cash_register/data/models/product.dart';

class ListingRepository {
  List<Map<String, dynamic>> addArticleToListing(
      Product product, List<Map<String, dynamic>> listing,
      {String quantity}) {
    Map<String, dynamic> newArticle;

    int count = 0;
    int added = 0;

    if(quantity == null || quantity == ''){
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
      'quantity': count,
      'total': count * product.price
    };
    listing.add(newArticle);
    return listing;
  }

  List<Map<String, dynamic>> removeArticleToListing(
      Product product, List<Map<String, dynamic>> listing) {
    listing.removeWhere((item) => item['product'] == product);

    return listing;
  }
}
