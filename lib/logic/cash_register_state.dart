part of 'cash_register_cubit.dart';

@immutable
abstract class CashRegisterState {
  const CashRegisterState();
}

class CashRegisterInitial extends CashRegisterState {
  const CashRegisterInitial();
}

class ProductLoading extends CashRegisterState {
  const ProductLoading();
}

class CashFundValidated extends CashRegisterState {
  final int cashFund;
  const CashFundValidated(this.cashFund);
}

class ProductLoaded extends CashRegisterState {
  final List<Product> products;
  const ProductLoaded(this.products);
}

class ProductError extends CashRegisterState {
  const ProductError();
}

class SumLoading extends CashRegisterState {
  const SumLoading();
}

class SumLoaded extends CashRegisterState {
  final List<Product> products;
  const SumLoaded(this.products);
}

class SumError extends CashRegisterState {
  const SumError();
}
