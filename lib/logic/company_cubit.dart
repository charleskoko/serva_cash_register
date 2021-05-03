import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/repositories/company_repository.dart';
import 'package:serva_cash_register/data/services/company_service.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepository _companyRepository;
  CompanyCubit(this._companyRepository) : super(CompanyInitial()) {
    getCompanies();
  }

  void getCompanies() async {
    emit(CompanyLoading());
    final List<Company> companies = await _companyRepository.getCompanies();
    final Company selectedCompany =
        await _companyRepository.getSelectedCompany();
    emit(CompanyLoaded(companies, selectedCompany));
  }

  void updateCompany() {}

  void deleteCompany() {}

  void selectCompany(Company company, CompanyLoaded state) async {
    _companyRepository.setSelectedCompany(company);
    final Company selectedCompany =
        await _companyRepository.getSelectedCompany();
    emit(CompanyLoaded(state.companies, selectedCompany));
  }
}
