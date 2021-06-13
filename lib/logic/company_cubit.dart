import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/repositories/company_repository.dart';
import 'package:serva_cash_register/data/services/company_service.dart';

part 'states/company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final CompanyRepository _companyRepository;
  CompanyCubit(this._companyRepository) : super(CompanyInitial()) {
  }



  void updateCompany() {}

  void deleteCompany() {}


}
