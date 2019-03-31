import 'dart:convert';
import 'dart:io';

import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/redux/items/items_action.dart';
import 'package:hacker_news/redux/items/items_middleware.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  group('item middeware', () {

    var itemJson;

    setUp(() async {
      final itemFile = File('test_resources/item.json');
      itemJson = json.decode(await itemFile.readAsString());
    });
    
    test('fetch item', (){
      final mockRepository = MockRepository();
      
      Store store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
        middleware: [ItemMiddleware(mockRepository)]
      );

      final item = Item.fromJson(itemJson);

      when(mockRepository.fetchItem(100)).thenAnswer((_) => Future.value(item));

      store.dispatch(FetchItemAction(100));

      verify(mockRepository.fetchItem(100));

    });
  });
}