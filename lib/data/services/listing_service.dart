import 'dart:convert';
import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_saved_order_label_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_user_service_provider.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/models/order_item.dart';
import 'package:serva_cash_register/data/models/service.dart';

import 'locator_service.dart';

class ListingService {
  LocalSavedOrderLabel _localSavedOrderLabel = LocalSavedOrderLabel();
  ServaHelper _servaHelper = ServaHelper();
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  LocalUserServiceProvider _localInitialBalanceProvider =
  LocalUserServiceProvider();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();

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

  saveOrderItems(List<Map<String, dynamic>> listing,
      Map<String, dynamic> paymentMethod) async {
    List<Map<String, dynamic>> orderItems = [];
    final Service service =
        await _localInitialBalanceProvider.readInitialBalance();
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();
    for (Map<String, dynamic> element in listing) {
      Map<String, dynamic> orderItem = {
        'article_id': element['product'].id,
        'price': element['price'],
        'article': jsonEncode(element['product'].toJson()),
        'quantity': element['quantity']
      };
      orderItems.add(orderItem);
    }

    Map<String, dynamic> data = {
      'orderItems': orderItems,
      'method': paymentMethod['paymentMethod'],
      'value': paymentMethod['value']
    };

    try {
      final Map<String, dynamic> response = await _httpRequest.post(
          EndPoint.postOrderItem(company.id, service.id),
          data: data);
    } catch (e) {
      print('enregistrement order problem: $e');
    }
  }
}
