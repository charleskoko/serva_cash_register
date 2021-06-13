part of '../home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final User user;
  HomeLoaded(this.user);
}

class HomeSettingSelected extends HomeState {
  final User user;
  HomeSettingSelected(this.user);
}

class HomeInitialBalanceSelected extends HomeState {
  final User user;
  HomeInitialBalanceSelected(this.user);
}

class HomeCashRegisterSelected extends HomeState {}
