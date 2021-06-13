import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'states/payment_completed_state.dart';

class PaymentCompletedCubit extends Cubit<PaymentCompletedState> {
  PaymentCompletedCubit() : super(PaymentCompletedState(paymentMethod:{}));

  void paymentCompleted(Map<String, dynamic> paymentMethod){
    emit(PaymentCompletedState(paymentMethod: paymentMethod));
  }

  void paymentDeleted(){
    emit(PaymentCompletedState(paymentMethod: {}));
  }
}


