import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(LoginInitial());

  void login(Map<String, dynamic> credential) async {
    emit(LoginLoading());
    final Map<String, dynamic> response =
        await loginRepository.login(credential: credential);
    if (response['message'] != null) {
      emit(LoginError(response['message']));
    } else {
      loginRepository.setAuthInfo(response);
      User user = await loginRepository.getUser();
      emit(LoggedIn(user));
    }
  }
}
