// ignore_for_file: prefer_const_declarations

import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';
import 'package:flutter_basic_db/model/model.dart';
import 'package:sqflite_common/sqlite_api.dart' as sapi;

class DbProvider {
  static const String dbName = 'entity_data.db';
  static const int kVersion1 = 1;
  final lock = Lock(reentrant: true);
  final DatabaseFactory dbFactory;
  Database? db;

  DbProvider(this.dbFactory);

  Future<Database> openPath(String path) async {
    db = await dbFactory.openDatabase(path,
        version: kVersion1, onVersionChanged: _onVersionChanged);
    return db!;
  }

  Future<Database> get ready async =>
      db ??= await lock.synchronized<Database>(() async {
        if (db == null) {
          await open();
        }
        return db!;
      });

  void _onVersionChanged(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < kVersion1) {
      // await notesStore.addAll(db, [
      //   (DbNote()
      //         ..title.v = 'Simple title'
      //         ..content.v = 'Simple content'
      //         ..date.v = 1)
      //       .toMap(),
      //   (DbNote()
      //         ..title.v = 'Welcome to NotePad'
      //         ..content.v =
      //             'Enter your notes\n\nThis is a content. Just tap anywhere to edit the note.\n'
      //                 '${kIsWeb ? '\nYou can open multiple tabs or windows and see that the content is the same in all tabs' : ''}'
      //         ..date.v = 2)
      //       .toMap(),
      // ]);
    }
  }

  Future<Database> open() async {
    return await openPath(await fixPath(dbName));
  }

  Future<String> fixPath(String path) async => path;

  Future close() async {
    await db!.close();
  }

  Future deleteDb() async {
    await dbFactory.deleteDatabase(await fixPath(dbName));
  }
}
