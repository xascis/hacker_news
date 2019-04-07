import 'package:hacker_news/redux/app/app_middleware.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/app/app_reducer.dart';
import 'package:hacker_news/resources/api_provider.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

Store createStore() {
  final client = http.Client();
  final apiProvider = ApiProvider(client);
  final repository = Repository(apiProvider);

  return Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createMiddleware(repository),
  );
}