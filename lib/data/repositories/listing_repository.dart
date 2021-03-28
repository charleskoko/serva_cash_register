import 'package:serva_cash_register/data/models/product.dart';

class ListingRepository {
  List<Map<String, dynamic>> addArticleToListing(
      Product product, List<Map<String, dynamic>> listing) {
    Map<String, dynamic> newArticle = {'product': product, 'quantity': 1};
    print(listing);
    if (listing == null) {
      List<Map<String, dynamic>> listing = [];
      listing.add(newArticle);
      return listing;
    } else {
      listing.add(newArticle);
      return listing;
    }
  }
}
