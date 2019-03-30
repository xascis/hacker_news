import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/redux/items/items_middleware.dart';
import 'package:hacker_news/redux/top_stories/top_stories_middleware.dart';
import 'package:redux/redux.dart';

Store store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [
    ItemMiddleware(),
    TopStoriesMiddleware(),
  ]
);