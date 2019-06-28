import 'models/item.dart';

abstract class Repository {
  
  Future<List<int>> fetchTopStories();

  Future<Item> fetchItem(int id);

}