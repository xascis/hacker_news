import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/bloc/app_bloc.dart';
import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  group('init appbloc', () {
    final repository = MockRepository();

    var topStories;
    var item;

    setUpAll(() async {
      final topStoriesFile = File('test_resources/top_stories.json');
      topStories = json.decode(await topStoriesFile.readAsString());

      final itemFile = File('test_resources/item.json');
      item = json.decode(await itemFile.readAsString());

      when(repository.fetchTopStories()).thenAnswer(
        (_) => Future.value(List.castFrom(topStories))
      );

      when(repository.fetchItem(100)).thenAnswer(
        (_) => Future.value(Item.fromJson(item))
      );
    });

    test('fetch top stories', () {
      final appBloc = AppBloc(repository);

      expect(appBloc.topStories.value, TypeMatcher<List<int>>());
      expect(appBloc.topStories.value, isNotEmpty);
      expect(appBloc.topStories.stream, TypeMatcher<Observable>());
    });
    
  });
}