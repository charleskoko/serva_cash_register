import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/models/initial_balance.dart';

class LocalInitialBalanceProvider {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/InitialBalance.txt');
  }

  Future<File> writeInitialBalance(String initialBalance) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString('$initialBalance');
  }

  Future<InitialBalance> readInitialBalance() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      InitialBalance initialBalance =
          InitialBalance.fromJson(jsonDecode(contents));
      return initialBalance;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
