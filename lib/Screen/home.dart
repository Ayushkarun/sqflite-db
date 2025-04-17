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
      appBar: AppBar(
        title: Text('Sqlflite DB'),
      ),
     body: Center(
      child: ElevatedButton(onPressed: ()async{
       ///await DbHandler().insertData();
      final data = await DbHandler().readData();
      print(data);
      }, 
      child: Text("Insert")),

     ),
    );
  }
}