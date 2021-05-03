part of 'initial_balance_cubit.dart';

@immutable
abstract class InitialBalanceState {
  const InitialBalanceState();
}

class InitialBalanceInitial extends InitialBalanceState {}

class InitialBalanceInitialisation extends InitialBalanceState {}

class InitialBalanceSaved extends InitialBalanceState {
  final InitialBalance initialBalance;
  const InitialBalanceSaved(this.initialBalance);
}
