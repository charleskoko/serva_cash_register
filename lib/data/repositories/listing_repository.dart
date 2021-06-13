import 'dart:convert';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:serva_cash_register/data/services/listing_service.dart';

class ListingRepository {
  ListingService _listingService = ListingService();


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
        Article currentArticleFromList = item['product'];
        if (currentArticleFromList == product) {
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
    listing.sort((a, b) => b['quantity'].compareTo(a['quantity']));

    return listing;
  }

  Future<String> saveOrderLabel(String label) async {
    final String labelsString = await _listingService.readOrderLabel();
    if (label.isEmpty) {
      return 'isEmpty';
    } else if (labelsString == null) {
      List<String> labels = [];
      labels.add(label);
      await _listingService.writeOrderLabel(labels);
      return label;
    } else {
      final List<dynamic> labelList = await jsonDecode(labelsString);
      var result = _listingService.isLabelAlreadyInLabelList(label, labelList);

      if (result == true) {
        return 'isNotUnique';
      } else {
        labelList.add(label);
        await _listingService.writeOrderLabelFromList(labelList);
        return label;
      }
    }
  }

  Future<void> saveLocalOrder(listing, label) {
    _listingService.saveLocalListing(listing, label);
  }

  void localListingStorage() {}

  List<Map<String, dynamic>> removeArticleToListing(
      Article product, List<Map<String, dynamic>> listing) {
    listing.removeWhere((item) => item['product'] == product);

    return listing;
  }

  Future<List<OrderItem>> selectedLocalListing(orderItemLabel) async {
    final List<OrderItem> orderItems =
        await _listingService.selectLocalListing(orderItemLabel);

    return orderItems;
  }

  Map<String, dynamic> createListingElement(OrderItem element) {
    return {
      'product': element.article,
      'price': element.price,
      'quantity': element.quantity,
      'total': element.quantity * element.price
    };
  }

  deleteLocalListing(String label) {
    _listingService.deleteLocalListing(label);
  }

  saveOrderItem(
      List<Map<String, dynamic>> listing, Map<String, dynamic> paymentMethod) {
    _listingService.saveOrderItems(listing, paymentMethod);
  }
}
