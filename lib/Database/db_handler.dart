import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHandler {
  Database? _database;
  Future<Database?> get database async {
    if(_database !=null)
    {
      return _database;
    }
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
name TEXT,
age INTEGER
)
'''
        );
      },
    );
    return _database;
  }
insertData() async{
Database? db= await database;
db!.insert('databasetable', {
  'id':1,
  'name':'ayush',
  'age':23
});
}

readData() async{
Database? db= await database;
final list=await db!.query('databasetable');
return list;
}
}
