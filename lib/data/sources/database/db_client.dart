import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbClient {

  DbClient() { 
    if (db == null) init(); 
  }

  static Database db;

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "main.db");
    db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database newDb, int version) async {
    await newDb.execute("""CREATE TABLE Item (
      id INTEGER PRIMARY KEY, 
      deleted INTEGER, 
      type TEXT, 
      by TEXT, 
      time INTEGER, 
      text TEXT, 
      dead INTEGER, 
      parent INTEGER, 
      poll INTEGER, 
      kids BLOB, 
      url TEXT, 
      score INTEGER, 
      title TEXT, 
      parts BLOB, 
      descendents INTEGER
    )""");
  }
  Future close() async => db.close();
}