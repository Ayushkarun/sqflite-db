import 'package:flutter/material.dart';

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
      child: ElevatedButton(onPressed: (){}, 
      child: Text("Insert")),

     ),
    );
  }
}