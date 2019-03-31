import 'package:hacker_news/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class TopStoriesViewModel {
  final bool isLoading;
  final List<int> topStories;
  final String error;

  TopStoriesViewModel({this.isLoading, this.topStories, this.error});

  static TopStoriesViewModel fromStore(Store<AppState> store) {
    return TopStoriesViewModel(
      isLoading: store.state.topStoriesState.isLoading,
      topStories: store.state.topStoriesState.topStories,
      error: store.state.topStoriesState.error,
    );
  }
}