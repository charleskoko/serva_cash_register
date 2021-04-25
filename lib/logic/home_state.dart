part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final User user;
  HomeLoaded(this.user);
}

class HomeSettingSelected extends HomeState {}

class HomeInitialBalanceSelected extends HomeState {
  final User user;
  HomeInitialBalanceSelected(this.user);
}

class HomeCashRegisterSelected extends HomeState {
  final User user;
  HomeCashRegisterSelected(this.user);
}
