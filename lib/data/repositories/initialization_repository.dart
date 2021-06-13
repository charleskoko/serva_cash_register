import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/repositories/company_repository.dart';
import 'package:serva_cash_register/data/services/initialization_service.dart';

class InitializationRepository {
  CompanyRepository _companyRepository = CompanyRepository();
  InitializationService _initializationService = InitializationService();

  Future<Company> getCompany() async {
    try {
      final Company company = await _companyRepository.getCompany();

      return company;
    } on FileSystemExceptionError {
      throw FileSystemExceptionError();
    }
  }

  Future<List<Company>> startInitialize(credential) async {
    try {
      final List<Company> companies =
          await _initializationService.initialize(credential);
      return companies;
    } on UnauthorizedError {
      throw UnauthorizedError();
    } on NoServerConnectionError{
      throw NoServerConnectionError();
    }
  }

  void writeCompany(Company selectedCompany) async {
    _initializationService.setCompany(selectedCompany);
  }
}
