part of '../initial_balance_cubit.dart';

@immutable
abstract class InitialBalanceState {
  const InitialBalanceState();
}

class InitialBalanceInitial extends InitialBalanceState {}

class InitialBalanceInitialisation extends InitialBalanceState {}

class InitialBalanceError extends InitialBalanceState {
  final String message;
  InitialBalanceError(this.message);
}

class InitialBalanceSaved extends InitialBalanceState {
  final Service initialBalance;
  const InitialBalanceSaved(this.initialBalance);
}
