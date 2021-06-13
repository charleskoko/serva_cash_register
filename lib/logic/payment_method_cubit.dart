import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'states/payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodInitial());

  void cashSelected() {
    emit(CashSelected());
  }

  void otherSelected() {
    emit(OtherSelected());
  }

}
