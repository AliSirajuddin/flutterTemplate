import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/model_list.dart';

import 'db.dart';

//Future<void> main() async {
//runApp(MyApp());
//} "if you use database"

void main() async {
  runApp(MyApp());
} // if you didn't use database

/// main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: MyStatefulWidget(),
        backgroundColor: Color(0xFFE8F5F8),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  DbIntance databaseInstance = DbIntance();
  var result;

  @override
  void initState() {
    databaseInstance.chkDatabase();
    super.initState();
    getdata();
  } //use it to update the code inside continuously

  void getdata() {
    setState(() {
      result = databaseInstance.all();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Center(
      child: FutureBuilder<List<todolist>>(
        future: databaseInstance.all(),
        builder: (context, snapshot) {
          print(snapshot.data!.length);
          if (snapshot.hasData) {
            if (snapshot.data!.length == 0) {
              return Center(child: Text("data masih kosong"));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].actName ?? ''),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
        },
      ),
    );
  }
}
