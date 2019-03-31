import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/redux/top_stories/top_stories_action.dart';
import 'package:hacker_news/redux/top_stories/top_stories_middleware.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  group('top stories middeware', () {
    test('fetch top stories', (){
      final mockRepository = MockRepository();
      
      Store store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
        middleware: [TopStoriesMiddleware(mockRepository)]
      );

      final topStories = [1, 2, 3, 4, 5];

      when(mockRepository.fetchTopStories()).thenAnswer((_) => Future.value(topStories));

      store.dispatch(FetchTopStoriesAction());

      verify(mockRepository.fetchTopStories());

    });
  });
}