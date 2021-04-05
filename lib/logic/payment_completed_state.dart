part of 'payment_completed_cubit.dart';

@immutable
class PaymentCompletedState {
  final Map<String, dynamic> paymentMethod;
  const PaymentCompletedState({@required this.paymentMethod});
}
