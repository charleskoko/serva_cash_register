import 'dart:convert';
import 'dart:io';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/models/failure.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class CompanyService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  AuthService _authService = AuthService();
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();

  Future<Company> getSelectedCompany() async {
    try {
      final Company company =
          await _localSelectedCompanyProvider.readSelectedCompany();

      return company;
    } on FileSystemException {
      throw FileSystemExceptionError();
    }
  }

  Future<void> setSelectedCompany(Company company) async {
    await _localSelectedCompanyProvider
        .writeSelectedCompany(jsonEncode(company.toJson()));
  }
}
