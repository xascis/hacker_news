import 'dart:convert';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:hacker_news/utils/constants_utils.dart';
import 'package:http/http.dart' as http;

class ApiProvider implements Source {
  final http.Client _client;

  const ApiProvider(this._client);
  
  Future<List<int>> fetchTopStories([http.Client client]) async  {
    return List.castFrom(await fetch(client, 'topstories.json'));
  }
  Future<Item> fetchItem(int id, [http.Client client]) async  {
    return Item.fromJson(await fetch(client, 'item/$id.json'));
  }

  Future<dynamic> fetch(http.Client client, String url) async {
    final response = await (client ?? this._client).get("$host/$url");

    if (!_responseSuccess(response)) throw http.ClientException(response.body);

    var jsonReponse = json.decode(response.body);
    
    if (response.statusCode == 401) throw ApiException(jsonReponse["error"]);

    if (jsonReponse == null) throw ApiException("Not found");

    return jsonReponse;
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