import 'models/item.dart';

abstract class Repository {
  
  Future<List<int>> fetchTopStories();

  Future<Item> fetchItem(int id);

  Future<void> insertItems(List<Item> items);

  Future<Item> selectItem(int id);

}