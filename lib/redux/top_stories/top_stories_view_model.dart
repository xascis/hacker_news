import 'package:hacker_news/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class TopStoriesViewModel {
  final bool isLoading;
  final List stories;
  final String error;

  TopStoriesViewModel({this.isLoading, this.stories, this.error});

  static TopStoriesViewModel fromStore(Store<AppState> store) {
    return TopStoriesViewModel(
      isLoading: store.state.topStoriesState.isLoading,
      stories: store.state.topStoriesState.stories,
      error: store.state.topStoriesState.error,
    );
  }
}