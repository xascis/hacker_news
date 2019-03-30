import 'dart:convert';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:hacker_news/utils/constants_utils.dart';
import 'package:http/http.dart' as http;

class ApiProvider implements Source {
  http.Client client = http.Client();
  
  Future<List<int>> fetchTopStories() async  => List.castFrom(await _fetch('topstories.json'));
  Future<Item> fetchItem(int id) async  => Item.fromJson(await _fetch('item/$id.json'));

  Future<dynamic> _fetch(String url) async {
    final response = await client.get("$host/$url");

    if (response.statusCode == 401) throw ApiException(json.decode(response.body)["error"]);
    if (!_responseSuccess(response)) throw http.ClientException(response.body);

    return json.decode(response.body);
  }
  bool _responseSuccess(response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}

class ApiException implements Exception {
  final String error;

  ApiException(this.error);

  toString(){
    if(this.error == null) return "ApiException";
    return "${this.error}";
  }
}