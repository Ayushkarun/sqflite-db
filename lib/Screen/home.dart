//In this data is already set on the code not by user passing
import 'package:flutter/material.dart';
import 'package:sql/Database/db_handler.dart';

class sqldb extends StatefulWidget {
  const sqldb({super.key});

  @override
  State<sqldb> createState() => _sqldbState();
}

class _sqldbState extends State<sqldb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqlflite DB')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await DbHandler().insertData(5, 'ayush', 23);
                //await DbHandler().insertData();
              },
              child: Text("Insert"),
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await DbHandler().readData();
                print(data);
              },
              child: Text("Read"),
            ),

            ElevatedButton(
              onPressed: () async {
                await DbHandler().deleteData(4);
                print('data deleted');
              },
              child: Text("Delete"),
            ),
            ElevatedButton(
              onPressed: () async {
                await DbHandler().updateData(3, {
                  'id': 3,
                  'name': 'ads',
                  'age': 22,
                });
                print('updated data');
              },
              child: Text("update"),
            ),
          ],
        ),
      ),
    );
  }
}
