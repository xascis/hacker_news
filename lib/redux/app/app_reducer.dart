import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/post/post_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    postState: postReducer(state.postState, action),
  );
}