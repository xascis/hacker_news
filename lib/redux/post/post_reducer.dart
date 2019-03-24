import 'package:hacker_news/redux/post/post_actions.dart';
import 'package:hacker_news/redux/post/post_state.dart';
import 'package:redux/redux.dart';

final postReducer = combineReducers<PostState>([
  TypedReducer<PostState, ShowPostAction>(_showPost),
  TypedReducer<PostState, LoadingPostAction>(_loadingPost),
]);

PostState _showPost(PostState state, ShowPostAction action){
  return state.copyWith(isLoading: action.isLoading, posts: action.posts);
}
PostState _loadingPost(PostState state, LoadingPostAction action) {
  return state.copyWith(isLoading: action.isLoading);
}
