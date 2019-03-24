import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/redux/post/post_middleware.dart';
import 'package:redux/redux.dart';

Store store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [
    PostMiddleware(),
  ]
);