import 'package:hacker_news/models/item.dart';

// class LoadingItemAction {
//   final bool isLoading;
//   LoadingItemAction(this.isLoading);
// }

class AddItemAction {
  final Item item;
  AddItemAction(this.item);
}

// class ErrorItemAction {
//   final String error;
//   ErrorItemAction(this.error);
// }

// no reducer
class FetchItemAction {
  final int id;
  FetchItemAction(this.id);
}