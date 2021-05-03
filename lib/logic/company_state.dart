part of 'company_cubit.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Company> companies;
  final Company selectedCompany;
  CompanyLoaded(this.companies, this.selectedCompany);
}

class CompanyUpdated extends CompanyState {}

class CompanyDeleted extends CompanyState {}
