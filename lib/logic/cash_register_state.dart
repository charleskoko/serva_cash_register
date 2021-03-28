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

class ProductLoaded extends CashRegisterState {
  final List<Product> products;
  const ProductLoaded(this.products);
}

class ProductError extends CashRegisterState {
  const ProductError();
}

class ListUpdating extends CashRegisterState {
  const ListUpdating();
}

class ListUpdated extends CashRegisterState {
  const ListUpdated();
}

class SumError extends CashRegisterState {
  const SumError();
}
