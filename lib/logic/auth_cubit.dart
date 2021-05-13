import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial()) {
    AuthenticationVerification();
  }

  void AuthenticationVerification() async {
    emit(AuthenticationLoading());
    final String token = await authRepository.getUserToken();
    if (token == null) {
      emit(NotAuthenticated());
    } else {
      User user = await authRepository.getAuthUser();
      emit(Authenticated(user));
    }
  }
}
