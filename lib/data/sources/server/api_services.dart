import 'package:hacker_news/data/sources/server/api_client.dart';
import 'package:hacker_news/domain/models/item.dart';
import 'package:http/http.dart' as http;

class ApiServices extends ApiClient {
  ApiServices(http.Client client) : super(client);

  Future<List<int>> fetchTopStories() async {
    return List.castFrom(await fetch('topstories.json'));
  }
  Future<Item> fetchItem(int id) async {
    return Item.fromJson(await fetch('item/$id.json'));
  }

}

var apiServices = ApiServices(http.Client());