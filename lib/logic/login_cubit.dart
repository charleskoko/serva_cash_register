import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/core/abstract/const.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/repositories/initialization_repository.dart';
import 'package:serva_cash_register/data/repositories/login_repository.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/logic/auth_cubit.dart';

part 'states/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(LoginInitial());
  LocalSelectedCompanyProvider _localSelectedCompanyProvider =
      LocalSelectedCompanyProvider();
  InitializationRepository _initializationRepository =
      InitializationRepository();

  void login(Map<String, dynamic> credential) async {
    emit(LoginLoading());
    final Map<String, dynamic> response =
        await loginRepository.login(credential: credential);
    if (response['message'] != null) {
      emit(LoginError(response['message']));
    } else {
      final Company company =
          await _localSelectedCompanyProvider.readSelectedCompany();
      Map<String, dynamic> body = response['user'];
      User user = User.fromJson(body);
      if (user.role == Constant.USER_EMPLOYEE) {
        if (user.company != company) {
          emit(NotTeamMember());
        } else if (user.company == company) {
          loginRepository.setAuthInfo(response);
          User user = await loginRepository.getUser();
          emit(LoggedIn(user));
        }
      }
      if (user.role == Constant.USER_OWNER) {
        bool isTeamMember = false;
        final Company company =
            await _localSelectedCompanyProvider.readSelectedCompany();
        final List<Company> companies =
            await _initializationRepository.startInitialize(credential);
        for (Company companyInList in companies) {
          if (companyInList == company) {
            isTeamMember = true;
          }
        }
        if (isTeamMember == true) {
          loginRepository.setAuthInfo(response);
          emit(LoggedIn(user));
        } else {
          emit(LoggedIn(user));
        }
      }
    }
  }
}
