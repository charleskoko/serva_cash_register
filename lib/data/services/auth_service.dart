import 'package:serva_cash_register/data/data_provider/local_auth_user_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_token_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';

class AuthService {
  LocalTokenProvider _localTokenProvider = LocalTokenProvider();
  LocalAuthUserProvider _localAuthUserProvider = LocalAuthUserProvider();

  Future<String> getToken() async {
    return await _localTokenProvider.readToken();
  }

  Future<User> getAuthUser() async {
    return await _localAuthUserProvider.readAuthUser();
  }
}
