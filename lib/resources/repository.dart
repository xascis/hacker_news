import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/api_provider.dart';

class Repository {
  final ApiProvider _apiProvider;

  static List<Source> _sources;
  static List<Cache> _caches;

  Repository(this._apiProvider) {
    _sources = [
      _apiProvider,
      // TODO: add DB_Provider
    ];

    _caches = <Cache> [
      // TODO: add DB_Provider
    ];
  }

    

  Future<List<int>> fetchTopStories() async {
    List<int> list;

    for (Source source in _sources) {
      list = await source.fetchTopStories();
      if (list != null) break;
    }

    // TODO: add to cache ???
    // for (cache in caches) {
    //   cache.addListItem(item);
    // }

    return list;
  }

  Future<Item> fetchItem(int id) async {
    Item item;
    // Cache cache;

    for (Source source in _sources) {
      item = await source.fetchItem(id);
      if (item != null) break;
    }

    // TODO: add to cache
    // for (cache in caches) {
    //   cache.addItem(item);
    // }

    return item;
  }

}

// Repository repository = Repository();


abstract class Source {
  Future<List<int>> fetchTopStories();
  Future<Item> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(Item item);
}