import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'dart:io';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/company.dart';

class LocalSelectedCompanyProvider {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/SelectedCompany.txt');
  }

  Future<File> writeSelectedCompany(String company) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString('$company');
  }

  Future<Company> readSelectedCompany() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      Company company = Company.fromJson(jsonDecode(contents));
      return company;
    } catch (e) {
      throw FileSystemExceptionError();
    }
  }
}
