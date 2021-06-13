import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'dart:io';
import 'package:serva_cash_register/data/models/User.dart';
import 'package:serva_cash_register/data/models/company.dart';

class LocalArticleStatus {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/LocalArticleStatus.txt');
  }

  Future<File> writeSelectedCompany({@required String isSavedLocal}) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString('$isSavedLocal');
  }

  Future<String> readSelectedCompany() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      throw FileSystemExceptionError();
    }
  }
}
