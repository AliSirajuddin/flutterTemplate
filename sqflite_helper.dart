import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'model_list.dart';

class DbIntance {
  final _databaseName = "my_database.db";
  final int _databaseVersion = 1;
  final String name = "todolist"; //table name

  //column name
  final String id = "id";
  final String actName = "actName";
  final String actDesc = "actDesc";
  final String deadLine = "deadLine";
  
  
//init variable that extend database
  Database? _database;
  
  // check database
  Future<Database> chkDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
// make db directory
  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _oncreateDb);
  }
// make table
  Future _oncreateDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $name ($id INTEGER PRIMARY KEY  , $actName TEXT, $actDesc TEXT NULL,$deadLine TEXT NULL)');
  }
// get data from db as json
  Future<List<todolist>> all() async {
    final data = await _database!.query(name);
    List<todolist> result = data.map((e) => todolist.fromJson(e)).toList();
    return result;
  }
// insert data
  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(name, row);
    return query;
  }
}
