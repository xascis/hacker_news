import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/items/items_action.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:redux/redux.dart';

class ItemMiddleware extends MiddlewareClass<AppState> {
  final Repository repository;

  ItemMiddleware(this.repository);

  @override
  Future<void> call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is FetchItemAction) await _fetchItem(action, next);
    
    next(action);
  }

  Future<void> _fetchItem(FetchItemAction action, NextDispatcher next) async {
    // next(LoadingItemAction(true));

    Item item = await repository.fetchItem(action.id).catchError((e) => print("$e"));

    next(AddItemAction(item));
  }
}