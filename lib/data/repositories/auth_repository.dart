import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

class AuthRepository{
  AuthService _authService = AuthService();

  Future<String> getUserToken() async {
    return await _authService.getToken();
  }

  Future<User> getAuthUser() async {
    return await _authService.getAuthUser();
  }

}
