import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

class SettingRepository {
  AuthService _authService = AuthService();

  Future<User> getAuthUser() async {
    return await _authService.getAuthUser();
  }
}
