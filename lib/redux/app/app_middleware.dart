import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/items/items_middleware.dart';
import 'package:hacker_news/redux/top_stories/top_stories_middleware.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware(Repository repository) {
  return [
    ItemMiddleware(repository),
    TopStoriesMiddleware(repository),
  ];
}