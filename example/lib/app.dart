// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_db/provider/person_provider.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';
import 'package:tekartik_app_platform/app_platform.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';
import 'package:flutter_basic_db/basic_db.dart';
import 'package:flutter_basic_db/src/import_sqflite.dart' as sqflite;

import 'main.dart';

late DbProvider dbProvider;
// late DbPersonProvider personProvider;

/// App initialization
Future<void> appInit({required String packageName}) async {
  WidgetsFlutterBinding.ensureInitialized();
  platformInit();
  // For dev, find the proper sqlite3.dll
  if (!kIsWeb) {
    sqflite.sqfliteWindowsFfiInit();
  }
  var databaseFactory = getDatabaseFactory(packageName: packageName);
  dbProvider = DbProvider(databaseFactory);
  debugDevPrint('/db Starting');
  await dbProvider.ready;

  // cvAddConstructor(DbPerson.new);
  // personProvider = DbPersonProvider(dbProvider.db);
  // personProvider.test();
}
