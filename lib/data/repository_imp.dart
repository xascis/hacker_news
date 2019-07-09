import 'package:hacker_news/data/sources/database/db_services.dart';
import 'package:hacker_news/data/sources/server/api_services.dart';
import 'package:hacker_news/domain/models/item.dart';
import 'package:hacker_news/domain/repository.dart';

class RepositoryImp implements Repository {
  final ApiServices apiServices;
  final DbServices dbServices;

  RepositoryImp(this.apiServices, this.dbServices);
  
  @override Future<List<int>> fetchTopStories() {
    return apiServices.fetchTopStories();
  }

  @override Future<Item> fetchItem(int id) {
    return apiServices.fetchItem(id);
  }

  @override Future<void> insertItems(List<Item> items) async {
    dbServices.insertItems(items.map((item) => item.toDb()).toList());
  }

  @override Future<Item> selectItem(int id) async {
    return Item.fromDb(await dbServices.selectItem(id));
  }

}