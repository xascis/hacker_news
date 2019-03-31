import 'package:hacker_news/redux/top_stories/top_stories_action.dart';
import 'package:hacker_news/redux/top_stories/top_stories_state.dart';
import 'package:redux/redux.dart';

final topStoriesReducer = combineReducers<TopStoriesState>([
  TypedReducer<TopStoriesState, LoadingTopStoriesAction>(_loadingTopStories),
  TypedReducer<TopStoriesState, ShowTopStoriesAction>(_showTopStories),
  TypedReducer<TopStoriesState, ErrorTopStoriesAction>(_errorTopStories),
]);

TopStoriesState _loadingTopStories(TopStoriesState state, LoadingTopStoriesAction action) {
  return state.copyWith(isLoading: action.isLoading);
}
TopStoriesState _showTopStories(TopStoriesState state, ShowTopStoriesAction action){
  return state.copyWith(isLoading: action.isLoading, topStories: action.topStories);
}
TopStoriesState _errorTopStories(TopStoriesState state, ErrorTopStoriesAction action) {
  return state.copyWith(error: action.error);
}

