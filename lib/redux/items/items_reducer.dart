import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/items/items_action.dart';
import 'package:redux/redux.dart';

final itemsReducer = combineReducers<Map<int, Item>>([
  TypedReducer<Map<int, Item>, AddItemAction>(_addItem),
  // TypedReducer<List<Item>, LoadingItemAction>(_loadingTopStories),
  // TypedReducer<List<Item>, ErrorItemAction>(_errorTopStories),
]);

Map<int, Item> _addItem(Map<int, Item> items, AddItemAction action){
  return Map.from(items)..addAll({action.item.id: action.item});
}
// List<Item> _loadingTopStories(List<Item> state, LoadingItemAction action) {
//   return state.copyWith(isLoading: action.isLoading);
// }
// List<Item> _errorTopStories(List<Item> state, ErrorItemAction action) {
//   return state.copyWith(error: action.error);
// }