
import 'package:hacker_news/data/sources/remote/api_services.dart';
import 'package:hacker_news/domain/models/item.dart';
import 'package:hacker_news/domain/repository.dart';

class RepositoryImp implements Repository {
  final ApiServices apiServices;

  RepositoryImp(this.apiServices);
  
  @override Future<List<int>> fetchTopStories() {
    return apiServices.fetchTopStories();
  }

  @override Future<Item> fetchItem(int id) {
    return apiServices.fetchItem(id);
  }

}