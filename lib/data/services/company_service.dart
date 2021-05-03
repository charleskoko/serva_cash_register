import 'dart:convert';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class CompanyService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  AuthService _authService = AuthService();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();

  Future<List<Company>> getCompanies() async {
    List<Company> companies;

    final User user = await _authService.getAuthUser();
    if (user.isAdmin == 1) {
      final Map<String, dynamic> response =
          await _httpRequest.get(EndPoint.Company);
      List<dynamic> body = response['data'];
      companies = body.map((element) => Company.fromJson(element)).toList();
    } else {
      companies = [];
    }

    return companies;
  }

  Future<void> deleteCompany() {}
  Future<void> updateCompany() {}

  Future<Company> getSelectedCompany() async {
    final Company company =
        await _localSelectedCompanyProvider.readSelectedCompany();

    return company;
  }

  Future<void> setSelectedCompany(Company company) async {
    await _localSelectedCompanyProvider
        .writeSelectedCompany(jsonEncode(company.toJson()));
  }
}
