import 'package:hacker_news/redux/top_stories/top_stories_action.dart';
import 'package:hacker_news/redux/top_stories/top_stories_state.dart';
import 'package:redux/redux.dart';

final topStoriesReducer = combineReducers<TopStoriesState>([
  TypedReducer<TopStoriesState, ShowTopStoriesAction>(_showTopStories),
  TypedReducer<TopStoriesState, LoadingTopStoriesAction>(_loadingTopStories),
  TypedReducer<TopStoriesState, ErrorTopStoriesAction>(_errorTopStories),
]);

TopStoriesState _showTopStories(TopStoriesState state, ShowTopStoriesAction action){
  return state.copyWith(isLoading: action.isLoading, stories: action.stories);
}
TopStoriesState _loadingTopStories(TopStoriesState state, LoadingTopStoriesAction action) {
  return state.copyWith(isLoading: action.isLoading);
}
TopStoriesState _errorTopStories(TopStoriesState state, ErrorTopStoriesAction action) {
  return state.copyWith(error: action.error);
}

