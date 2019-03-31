import 'package:hacker_news/redux/app/app_middleware.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

Store createStore() {
  final client = Client();
  final repository = Repository(client);

  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createMiddleware(repository),
  );
}