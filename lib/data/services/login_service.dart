import 'dart:convert';

import 'package:serva_cash_register/data/data_provider/local_auth_user_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_token_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';

class LoginService {
  LocalTokenProvider _localTokenProvider = LocalTokenProvider();
  LocalAuthUserProvider _localAuthUserProvider = LocalAuthUserProvider();

  void setAuthInfo(Map<String, dynamic> response) async {
    String user = jsonEncode(response['user']);
    String token = jsonEncode(response['token']);
    _localTokenProvider.writeToken(token);
    _localAuthUserProvider.writeAuthUser(user);
    await _localAuthUserProvider.readAuthUser();
    await _localTokenProvider.readToken();
  }

  Future<User> readAuthUser() async {
    return await LocalAuthUserProvider().readAuthUser();
  }
}
