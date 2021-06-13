part of '../initialization_cubit.dart';

@immutable
abstract class InitializationState {}

class InitializationInitial extends InitializationState {}

class InitializationLoading extends InitializationState {}

class InitializedUnknownAccount extends InitializationState {}

class InitializedFailedInternet extends InitializationState {}

class Initialized extends InitializationState {
  final Company selectedCompany;
  Initialized(this.selectedCompany);
}

class InitializedFirst extends InitializationState {}

class InitializationLoaded extends InitializationState {
  final List<Company> companies;
  final Company selectedCompany;
  InitializationLoaded(this.companies, {this.selectedCompany});
}

class NotInitialized extends InitializationState {}
