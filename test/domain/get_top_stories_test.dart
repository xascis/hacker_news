import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/domain/repository.dart';
import 'package:hacker_news/domain/usecases/get_top_stories.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements Repository {}

void main() {

  group('get top stories', () {

    final mockRepository = MockRepository();

    var topStories;
    var item;

    setUpAll(() async {
      final topStoriesFile = File('test_resources/top_stories.json');
      topStories = json.decode(await topStoriesFile.readAsString());

      final itemFile = File('test_resources/item.json');
      item = json.decode(await itemFile.readAsString());
    });

    test('get top stories, success', () async {
      when(mockRepository.fetchTopStories()).thenAnswer(
        (_) => Future.value(List.castFrom(topStories))
      );

      var result;
      await GetTopStories(mockRepository).call((list) => result = list, (e) => result = e);

      expect(result, TypeMatcher<List<int>>());
    });

    test('get top stories, error', () async {
      when(mockRepository.fetchTopStories()).thenAnswer(
        (_) => throw Exception("Error message")
      );

      var result;
      await GetTopStories(mockRepository).call((list) => result = list, (e) => result = e);

      expect(result, TypeMatcher<Exception>());

    });

  });
}