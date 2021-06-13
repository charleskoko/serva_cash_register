import 'dart:io';

import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/services/company_service.dart';

class CompanyRepository {
  CompanyService _companyService = CompanyService();

  Future<Company> getCompany() async {
    try {
      final Company company = await _companyService.getSelectedCompany();
      return company;
    } on FileSystemException {
      throw FileSystemExceptionError();
    }
  }

  Future<void> setSelectedCompany(Company company) async {
    await _companyService.setSelectedCompany(company);
  }
}
