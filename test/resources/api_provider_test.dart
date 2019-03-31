import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/api_provider.dart';
import 'package:hacker_news/utils/constants_utils.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('api provider', () {
    final client = http.Client();
    final apiProvider = ApiProvider(client);
    
    var topStories;
    var item;

    setUp(() async {
      final topStoriesFile = File('test_resources/top_stories.json');
      topStories = json.decode(await topStoriesFile.readAsString());

      final itemFile = File('test_resources/item.json');
      item = json.decode(await itemFile.readAsString());
    });


    test('fetch top stories, OK', () async {
      var mockClient = MockClient(); 

      when(mockClient.get("$host/topstories.json")).thenAnswer((_) async => http.Response(json.encode(topStories), 200));

      final response = await apiProvider.fetchTopStories(mockClient);

      expect(response, TypeMatcher<List<int>>());
    });

    test('fetch item, OK', () async {
      var mockClient = MockClient(); 

      when(mockClient.get("$host/100.json")).thenAnswer((_) async => http.Response(json.encode(item), 200));

      final response = await apiProvider.fetchItem(100, client);

      expect(response, TypeMatcher<Item>());
      
    });

    test('fetch item, null', () async {
      var mockClient = MockClient(); 

      when(mockClient.get("$host/topstories.json")).thenAnswer((_) async => http.Response(json.encode(null), 200));

      expect(
        () => apiProvider.fetchItem(0, client),
        throwsException,
      );
    });

    test('unauthorized fetch', () async {
      var mockClient = MockClient(); 

      when(mockClient.get("$host/topstories.json")).thenAnswer((_) async => http.Response(json.encode('{"error": "Permission denied"}'), 401));

      expect(
        () => apiProvider.fetch(client, "top"),
        throwsException,
      );
    });
  });
}