import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/services/http_request_api_service.dart';
import 'package:serva_cash_register/data/services/locator_service.dart';
import 'package:serva_cash_register/data/services/login_service.dart';

class LoginRepository {
  HttpRequestApiService _httpsRequest = getIt<HttpRequestService>();
  LoginService _loginService = LoginService();

  Future<Map<String, dynamic>> login({Map<String, dynamic> credential}) async {
    final Map<String, dynamic> response =
        await _httpsRequest.post(EndPoint.Login, data: credential);

    return response;
  }

  void setAuthInfo(Map<String, dynamic> response) {
    _loginService.setAuthInfo(response);
  }

  Future<User> getUser() {
    return _loginService.readAuthUser();
  }
}
