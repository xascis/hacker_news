import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/items/items_reducer.dart';
import 'package:hacker_news/redux/top_stories/top_stories_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    topStoriesState: topStoriesReducer(state.topStoriesState, action),
    items: itemsReducer(state.items, action),
  );
}