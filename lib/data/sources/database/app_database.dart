import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{
  // static final AppDatabase _instance = AppDatabase._internal();

  // factory AppDatabase() {
  //   return _instance;
  // }
  // AppDatabase._internal();

  static Database db;
  final String _dbName = "main.db";

  // Future<Database> get db async{
  //   if(_db != null) return _db;
  //   _db = await _initDb();
  //   return _db;
  // }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _dbName);
    db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database newDb, int version) async {
    await newDb.execute("CREATE TABLE ${_dbTable['item']} ($_sqlItemColumns)");
  }
  final Map<String, String> _dbTable= {
    'item': "Item",
  };
  static String _sqlItemColumns = "id INTEGER PRIMARY KEY, deleted INTEGER, type TEXT, by TEXT, time INTEGER, text TEXT, dead INTEGER, parent INTEGER, poll INTEGER, kids BLOB, url TEXT, score INTEGER, title TEXT, parts BLOB, descendents INTEGER";

  Future close() async => db.close();

  Future<List<Person>> getList01() async{
    List list = await _getTableRecords(_dbTable['table01']);
    return _mapToList(list);
  }
  Future<List<Person>> getList02() async{
    List list = await _getTableRecords(_dbTable['table02']);
    return _mapToList(list);
  }

  Future<List<Map<String, dynamic>>> _getTableRecords(String table) async{
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient.query(table);
    return list;
  }

  bool deleteAllTables(){
    _dbTable.forEach((key, value){
      _deleteAllPerson(value);
    });
    return true;
  }

  Future<int> _updateRegister({@required String table, @required Person person}) async{
    var dbClient = await db;
    int res = await dbClient.update(table, person.toMap(), where: "name=?", whereArgs: [person.name]);
    print("PRINT: AppDatabase: Actualizado ${person.name} de $table");
    return res;
  }
  Future<int> _deleteAllPerson(String table) async{
    var dbClient = await db;
    int res = await dbClient.delete(table);
    print("PRINT: AppDatabase: Eliminados todos los registros de $table");
    return res;
  }
  Future<int> _insertPerson({@required String table, @required Person person}) async {
    var dbClient = await db;
    int res = await dbClient.insert(table, person.toMap());
    print("PRINT: AppDatabase: ${person.name} guardado en $table");
    return res;
  }
  Future<int> _deletePerson({@required String table, @required Person peson}) async {
    var dbClient = await db;
    int res = await dbClient.delete(table, where: "name=?", whereArgs: [person.name]);
    print("PRINT: AppDatabase: ${peson.name} eliminado de $table");
    return res;
  }
}