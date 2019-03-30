import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/top_stories/top_stories_action.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:redux/redux.dart';

class TopStoriesMiddleware extends MiddlewareClass<AppState> {
  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is FetchTopStoriesAction) await _fetchTopStories(action, next);
    
    next(action);
  }

  Future<void> _fetchTopStories(dynamic action, NextDispatcher next) async {
    next(LoadingTopStoriesAction(true));
    
    // repository fetchTopStories
    List topStories = await Repository().fetchTopStories().catchError((e) => next(ErrorTopStoriesAction("$e")));

    next(ShowTopStoriesAction(false, topStories));
  }

}