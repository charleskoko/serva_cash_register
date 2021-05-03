import 'dart:convert';

import 'package:serva_cash_register/core/abstract/http_request_service.dart';
import 'package:serva_cash_register/data/data_provider/end_point.dart';
import 'package:serva_cash_register/data/data_provider/local_initial_balance_provider.dart';
import 'package:serva_cash_register/data/data_provider/local_selected_company_provider.dart';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/article.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/models/initial_balance.dart';
import 'package:serva_cash_register/data/services/auth_service.dart';

import 'locator_service.dart';

class InitialBalanceService {
  HttpRequestService _httpRequest = getIt<HttpRequestService>();
  AuthService _authService = AuthService();
  LocalInitialBalanceProvider _localInitialBalanceProvider =
      LocalInitialBalanceProvider();

  Future<InitialBalance> saveInitialBalance(data) async {
    final User user = await _authService.getAuthUser();

    final Map<String, dynamic> response = await _httpRequest
        .post(EndPoint.initialBalance(user.company.id), data: data);
    Map<String, dynamic> body = response['data'];
    _localInitialBalanceProvider.writeInitialBalance(jsonEncode(body));
    final InitialBalance test =
        await _localInitialBalanceProvider.readInitialBalance();
    InitialBalance initialBalance = InitialBalance.fromJson(body);
    return initialBalance;
  }

  Future<void> deleteArticle() {}
  Future<void> updateArticle() {}
}
