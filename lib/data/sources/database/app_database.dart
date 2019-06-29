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

  static Database _db;
  String _path;
  final String _dbName = "main.db";
  final Map<String, String> _dbTable= {
    'item': "Item",
  };

  // string para crear las tablas
  static String _sqlItemColumns = "name TINYTEXT, number INT";

  Future<Database> get db async{
    if(_db != null) return _db;
    _db = await _initDb();
    return _db;
  }

  _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    _path = join(documentsDirectory.path, _dbName);
    var theDb = await openDatabase(_path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE ${_dbTable['item']} ($_sqlItemColumns)");
  }

  Future close() async => _db.close();

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