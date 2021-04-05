part of 'payment_method_cubit.dart';

@immutable
abstract class PaymentMethodState {
  const PaymentMethodState();
}

class PaymentMethodInitial extends PaymentMethodState {
  const PaymentMethodInitial();
}

class CashSelected extends PaymentMethodState {
  const CashSelected();
}

class OtherSelected extends PaymentMethodState {
  const OtherSelected();
}

