import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/api_provider.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockApiProvider extends Mock implements ApiProvider {}

void main() {
  group('repository', (){
    final apiProvider = MockApiProvider();
    final repository = Repository(apiProvider);

    var topStories;
    var item;

    setUp(() async {
      final topStoriesFile = File('test_resources/top_stories.json');
      topStories = json.decode(await topStoriesFile.readAsString());

      final itemFile = File('test_resources/item.json');
      item = json.decode(await itemFile.readAsString());
    });

    test('fetch top items', () async {
      when(apiProvider.fetchTopStories()).thenAnswer((_) => Future.value(List.castFrom(topStories)));

      final response = await repository.fetchTopStories();

      expect(response, TypeMatcher<List<int>>());
      
    });

    test('fetch item', () async {
      when(apiProvider.fetchItem(100)).thenAnswer((_) => Future.value(Item.fromJson(item)));

      final response = await repository.fetchItem(100);

      expect(response, TypeMatcher<Item>());
      
    });

  });
}