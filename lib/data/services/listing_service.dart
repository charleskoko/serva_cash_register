import 'dart:convert';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/local_saved_order_label_provider.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class ListingService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  AuthService _authService = AuthService();
  LocalSavedOrderLabel _localSavedOrderLabel = LocalSavedOrderLabel();
  ServaHelper _servaHelper = ServaHelper();

  bool isLabelAlreadyInLabelList(String label, List<dynamic> labels) {
    bool isLabelAlreadyInLabelList = false;
    for (var element in labels) {
      if (element == label) {
        isLabelAlreadyInLabelList = true;
      }
    }

    return isLabelAlreadyInLabelList;
  }

  Future<String> readOrderLabel() async {
    return await _localSavedOrderLabel.readLocalSavedOrderLabel();
  }

  Future<void> writeOrderLabel(List<String> labels) async {
    _localSavedOrderLabel.writeLocalSavedOrderLabel(jsonEncode(labels));
  }

  Future<void> writeOrderLabelFromList(List<dynamic> labels) async {
    _localSavedOrderLabel.writeLocalSavedOrderLabel(jsonEncode(labels));
  }

  void saveLocalListing(listing, label) {
    List<OrderItem> orderItems = [];

    for (Map<String, dynamic> element in listing) {
      OrderItem orderItem = OrderItem(element['product'].id, label,
          element['product'], element['price'], element['quantity']);
      orderItems.add(orderItem);
    }
    for (OrderItem element in orderItems) {
      var result = _servaHelper.insertOrderItem(element);
    }
  }

  Future<List<OrderItem>> selectLocalListing(orderItem) async {
    final List<OrderItem> orderItems =
        await _servaHelper.getOrderItem(name: orderItem);

    return orderItems;
  }

  void deleteLocalListing(String label) {
    _servaHelper.deleteOrderITem(label);
  }
}
