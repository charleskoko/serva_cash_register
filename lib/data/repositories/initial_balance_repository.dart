import 'dart:convert';

import 'package:serva_cash_register/data/data_provider/local_initial_balance_provider.dart';
import 'package:serva_cash_register/data/models/initial_balance.dart';
import 'package:serva_cash_register/data/services/initial_balance_service.dart';

class InitialBalanceRepository {
  InitialBalanceService _initialBalanceService = InitialBalanceService();

  Future<InitialBalance> saveInitialBalance(data) async {
    final InitialBalance initialBalance =
        await _initialBalanceService.saveInitialBalance(data);

    return initialBalance;
  }
}
