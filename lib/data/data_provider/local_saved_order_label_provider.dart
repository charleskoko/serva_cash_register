import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LocalSavedOrderLabel {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/localSavedOrderLabel.txt');
  }

  Future<File> writeLocalSavedOrderLabel(String label) async {
    final file = await _localFile;
    // Write the file.
    return file.writeAsString('$label');
  }

  Future<String> readLocalSavedOrderLabel() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0.
      return null;
    }
  }
}
