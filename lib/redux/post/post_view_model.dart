import 'package:hacker_news/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class PostViewModel {
  final bool isLoading;
  final List<int> posts;

  PostViewModel({this.isLoading, this.posts});

  static PostViewModel fromStore(Store<AppState> store) {
    return PostViewModel(
      isLoading: store.state.postState.isLoading,
      posts: store.state.postState.posts,
    );
  }
}