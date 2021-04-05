import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'numeric_pad_state.dart';

class NumericPadCubit extends Cubit<NumericPadState> {
  NumericPadCubit() : super(NumericPadState(value: '0'));

  void keyboardClicked(String value) {
    String newValue;
    if (state.value == '0') {
      if (value == 'c' || value == 'delete' || value == '0') {
        newValue = '0';
      } else {
        newValue = value;
      }
    }
    if (state.value != '0') {
      if (value == 'delete') {
        newValue = state.value.substring(0, state.value.length - 1);
        if ((state.value.length - 1) == 0) {
          newValue = '0';
        }
      } else if (value == 'c') {
        newValue = '0';
      } else {
        newValue = state.value + value;
      }
    }

    emit(NumericPadState(value: newValue));
  }
}
