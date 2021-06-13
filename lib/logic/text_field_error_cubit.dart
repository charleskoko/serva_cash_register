import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'states/text_field_error_state.dart';

class TextFieldErrorCubit extends Cubit<TextFieldErrorState> {
  TextFieldErrorCubit() : super(TextFieldErrorState(false));

  void error() {
    emit(TextFieldErrorState(true));
  }

  void noError() {
    emit(TextFieldErrorState(false, isNotEmail: false));
  }

  void emailVerification() {
    emit(TextFieldErrorState(false, isNotEmail: true));
  }
}
