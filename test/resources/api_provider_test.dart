import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/resources/api_provider.dart';
import 'package:test/test.dart';

void main() {
  group('api provider', () {
    ApiProvider apiProvider = ApiProvider();

    test('fetch top stories, OK', () async {
      final response = await apiProvider.fetchTopStories();

      expect(response, TypeMatcher<List<int>>());
    });

    test('fetch item, OK', () async {
      final response = await apiProvider.fetchItem(100);

      expect(response, TypeMatcher<Item>());
      
    });
  });
}