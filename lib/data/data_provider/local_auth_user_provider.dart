import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:serva_cash_register/data/models/User.dart';

class LocalAuthUserProvider {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/AuthUser.txt');
  }

  Future<File> writeAuthUser(String user) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString('$user');
  }

  Future<User> readAuthUser() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();
      User user = User.fromJson(jsonDecode(contents));
      return user;
    } catch (e) {
      print('error: $e');
      return null;
    }
  }
}
