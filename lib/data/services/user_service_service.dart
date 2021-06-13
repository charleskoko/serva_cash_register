import 'dart:convert';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_user_service_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/models/service.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class UserServiceService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();
  LocalUserServiceProvider _localInitialBalanceProvider =
      LocalUserServiceProvider();

  Future<Service> saveInitialBalance(data) async {
    try {
      final Company company =
          await _localSelectedCompanyProvider.readSelectedCompany();
      final Map<String, dynamic> response =
          await _httpRequest.post(EndPoint.service(company.id), data: data);
      Map<String, dynamic> body = response['data'];
      _localInitialBalanceProvider.writeInitialBalance(jsonEncode(body));

      await _localInitialBalanceProvider.readInitialBalance();
      Service service = Service.fromJson(body);
      return service;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }

  Future<Service> view(String serviceId) async {
    try {
      final Company company =
          await _localSelectedCompanyProvider.readSelectedCompany();
      final Map<String, dynamic> response =
          await _httpRequest.get(EndPoint.getService(company.id, serviceId));
      print('response: $response');
      Map<String, dynamic> body = response['data'];

      Service service = Service.fromJson(body);
      return service;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }

  Future<void> delete() {}
  Future<bool> update(String id, {Map<String, String> data}) async {
    try {
      final Company company =
          await _localSelectedCompanyProvider.readSelectedCompany();
      final Map<String, dynamic> response = await _httpRequest
          .patch(EndPoint.getService(company.id, id), data: data);
      if (response['status'] == 'updated') {
        return true;
      } else {
        return false;
      }
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError {
      throw NoServerConnectionError();
    }
  }
}
