import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/redux/top_stories/top_stories_action.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

void main () {
  group('top stories reducer', () {
    test('top stories is loading', (){
      Store store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(LoadingTopStoriesAction(true));

      expect(store.state.topStoriesState.isLoading, true);
    });
    test('top stories show', (){
      Store store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(ShowTopStoriesAction(false, [1, 2, 3]));

      expect(store.state.topStoriesState.topStories, [1, 2, 3]);
      expect(store.state.topStoriesState.isLoading, false);
    });
    test('top stories error', (){
      Store store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(ErrorTopStoriesAction("Error"));

      expect(store.state.topStoriesState.error, "Error");
    });

  });
}