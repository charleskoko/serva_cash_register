import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/services/company_service.dart';

class CompanyRepository {
  CompanyService _companyService = CompanyService();

  Future<List<Company>> getCompanies() async {
    return await _companyService.getCompanies();
  }

  Future<Company> getSelectedCompany() async {
    return await _companyService.getSelectedCompany();
  }
  Future<void> setSelectedCompany(Company company) async {
     await _companyService.setSelectedCompany(company);
  }
}
