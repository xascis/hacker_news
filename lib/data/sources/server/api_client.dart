import 'dart:convert';

import 'package:hacker_news/data/common/globals.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<dynamic> fetch(String url) async {
    final response = await client.get("$host/$url");

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