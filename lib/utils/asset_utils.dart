import 'package:flutter/services.dart';

class AssetUtils {

  /// Assumes the given path is a text-file-asset.
  static Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }
}