import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

class HomeRepository{
  AuthService _authService = AuthService();

  Future<User> getAuthUSer(){
    return _authService.getAuthUser();
  }
}