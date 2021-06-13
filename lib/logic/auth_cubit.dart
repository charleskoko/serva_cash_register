import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/data/data_provider/serva_helper.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/repositories/auth_repository.dart';
import 'package:serva_cash_register/logic/initialization_cubit.dart';

part 'states/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final InitializationCubit initializationCubit;
  StreamSubscription initializationStreamSubscription;
  AuthCubit(this.authRepository, {@required this.initializationCubit})
      : super(AuthInitial()) {
    //monitoringInitializationCubit();
  }

  StreamSubscription<InitializationState> monitoringInitializationCubit() {
    return initializationStreamSubscription =
        initializationCubit.listen((initializationState) {
      if (initializationState is NotInitialized) {
        emit(AuthenticationLoading());
      } else if (initializationState is Initialized) {
        authenticationVerification();
      }
    });
  }

  void authenticationVerification() async {
    emit(AuthenticationLoading());
    final String token = await authRepository.getUserToken();
    if (token == null) {
      emit(NotAuthenticated());
    } else {
      User user = await authRepository.getAuthUser();
      emit(Authenticated(user));
    }
  }

  void userAuthenticated() async {
    User user = await authRepository.getAuthUser();
    emit(Authenticated(user));
  }

  @override
  Future<void> close() {
    initializationStreamSubscription.cancel();
    return super.close();
  }
}
