import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
  } //use it to update the code inside continuously

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Center(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
