import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/post/post_actions.dart';
import 'package:redux/redux.dart';

class PostMiddleware extends MiddlewareClass<AppState> {
  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is FetchPostAction) await _fetchPosts(action, next);
    
    next(action);
  }

  Future<void> _fetchPosts(dynamic action, NextDispatcher next) async {
    next(LoadingPostAction(true));
    
    await Future.delayed(Duration(seconds: 5));
    next(ShowPostAction(false, [10, 9, 8, 7, 6]));
  }

}