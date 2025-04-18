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
insertData(int id,String name,int age) async{
Database? db= await database;
Map<String,Object?> map=
{
  'id':id,
  'name':name,
  'age':age
};
db!.insert('databasetable', map);
}

// insertData() async{
// Database? db= await database;
// db!.insert('databasetable', {
//   'id':2,
//   'name':'ayushk',
//   'age':24
// });
// }


readData() async{
Database? db= await database;
final list=await db!.query('databasetable');
return list;
}

deleteData(int id) async{
Database? db= await database;

await db!.delete('databasetable',
where: 'id = ?',
whereArgs: [id]
);
}

updateData(int id,Map<String, Object> data) async{
  Database? db= await database;
  await db!.update('databasetable', data,
  where: 'id =?',
  whereArgs: [id]);
}


}
