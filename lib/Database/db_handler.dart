import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHandler {
  Database? _database;
  Future<Database?> database() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'mydatabase.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
CREATE TABLE databasetable (
id INTEGER PRIMARY KEY,
)
'''
        );
      },
    );
  }
}
