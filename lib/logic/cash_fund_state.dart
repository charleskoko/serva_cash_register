part of 'cash_fund_cubit.dart';

@immutable
abstract class CashFundState {
  const CashFundState();
}

class CashFundInitial extends CashFundState {
  const CashFundInitial();
}

class CashCanceled extends CashFundState{
  const CashCanceled();
}

class CashValidated extends CashFundState {
  final int cashFund;
  const CashValidated(this.cashFund);
}


