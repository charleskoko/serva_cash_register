import 'dart:convert';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class InitializationService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();

  Future<List<Company>> initialize(credential) async {
    try {
      final Map<String, dynamic> response =
          await _httpRequest.post(EndPoint.Initialize, data: credential);
      List<dynamic> body = response['data'];
      List<Company> companies =
          body.map((element) => Company.fromJson(element)).toList();
      return companies;
    } on UnauthorizedError {
      throw UnauthorizedError();
    }
  }

  Future<void> setCompany(Company company) async {
    String companyString = jsonEncode(company.toJson());
    await _localSelectedCompanyProvider.writeSelectedCompany(companyString);
  }

  Future<Company> getCompany() async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();

    return company;
  }

  Future<void> deleteArticle() {}
  Future<void> updateArticle() {}
}
