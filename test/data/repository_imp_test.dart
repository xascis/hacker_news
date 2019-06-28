import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/data/repository_imp.dart';
import 'package:hacker_news/data/sources/remote/api_services.dart';
import 'package:hacker_news/domain/models/item.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockApiServices extends Mock implements ApiServices {}

void main() {
  group('repository imp', (){
    final apiServices = MockApiServices();
    final repository = RepositoryImp(apiServices);

    var topStories;
    var item;

    setUpAll(() async {
      final topStoriesFile = File('test_resources/top_stories.json');
      topStories = json.decode(await topStoriesFile.readAsString());

      final itemFile = File('test_resources/item.json');
      item = json.decode(await itemFile.readAsString());
    });

    test('fetch top items', () async {
      when(apiServices.fetchTopStories()).thenAnswer(
        (_) => Future.value(List.castFrom(topStories))
      );

      final response = await repository.fetchTopStories();

      expect(response, TypeMatcher<List<int>>());
    });

    test('fetch item', () async {
      when(apiServices.fetchItem(100)).thenAnswer(
        (_) => Future.value(Item.fromJson(item))
      );

      final response = await repository.fetchItem(100);

      expect(response, TypeMatcher<Item>());
    });

  });
}