import 'package:hacker_news/domain/repository.dart';

class GetTopStories {
  final Repository repository;

  GetTopStories(this.repository);

  Future<void> call(Function(List<int>) success, Function(Exception) error) async {
    // await repository.fetchTopStories()
    // .then((list) => success(list))
    // .catchError((e) => error(e));
    
    try {
      var list = await repository.fetchTopStories();
      success(list);

    } catch (e) { error(e); }

  }
}