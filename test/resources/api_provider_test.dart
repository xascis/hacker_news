import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

void main() {
  group('api provider', () {
    ApiProvider apiProvider = ApiProvider();
    var topStories;
    var item;

    setUp(() async {
      final topStoriesFile = File('test_resources/top_stories.json');
      topStories = json.decode(await topStoriesFile.readAsString());

      final itemFile = File('test_resources/item.json');
      item = json.decode(await itemFile.readAsString());
    });


    test('fetch top stories, OK', () async {
      apiProvider.client = MockClient((resquest) async {
        return Response(json.encode(topStories), 200);
      }); 

      final response = await apiProvider.fetchTopStories();

      expect(response, TypeMatcher<List<int>>());
    });

    test('fetch item, OK', () async {
      apiProvider.client = MockClient((resquest) async {
        return Response(json.encode(item), 200);
      }); 

      final response = await apiProvider.fetchItem(100);

      expect(response, TypeMatcher<Item>());
      
    });

    test('fetch item, null', () async {
      apiProvider.client = MockClient((resquest) async {
        return Response(json.encode(null), 200);
      }); 
      expect(
        () => apiProvider.fetchItem(0),
        throwsException,
      );
    });

    test('unauthorized fetch', () async {
      apiProvider.client = MockClient((resquest) async {
        return Response(json.encode({"error": "Permission denied"}), 401);
      }); 

      expect(
        () => apiProvider.fetch("top"),
        throwsException,
      );
    });
  });
}