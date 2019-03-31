import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/redux/items/items_action.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

void main () {
  group('items reducer', () {
    Item item;

    setUp(() async {
      final itemFile = File('test_resources/item.json');
      item = Item.fromJson(json.decode(await itemFile.readAsString()));
    });

    test('add item', (){
      Store store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );

      store.dispatch(AddItemAction(item));

      expect(store.state.items, {item.id: item});
      
    });
  });
}