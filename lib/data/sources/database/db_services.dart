import 'package:hacker_news/data/sources/database/db_client.dart';

class DbServices extends DbClient {

  Future<int> insertItem(Map item) {
    return DbClient.db.insert('Items', item);
  }

  Future<void> insertItems(List<Map> items) async {
    return items.map((item) async => await DbClient.db.insert('Items', item));
  }

  Future<Map> selectItem(int id) async {
    return (await DbClient.db.query('Items', where: "id=?", whereArgs: [id])).first;
  }

  Future<List<Map<String, dynamic>>> selectItems() {
    return DbClient.db.query('Items');
  }

  Future<int> updateItem(int id, Map item) {
    return DbClient.db.update('Items', item, where: "id=?", whereArgs: [id]);
  }

  Future<int> deleteItems() {
    return DbClient.db.delete('Items');
  }

}
