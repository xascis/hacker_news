import 'package:bloc_provider/bloc_provider.dart';
import 'package:hacker_news/domain/usecases/get_top_stories.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc implements Bloc {
  final GetTopStories getTopStories;

  AppBloc(this.getTopStories) {
    showTopStories();
  }

  final topStories = BehaviorSubject<List<int>>();
  // Observable<List<int>> get topStories => topStories.stream;
  Function(List<int>) get _addTopStories => topStories.sink.add;
  
  void showTopStories() async {
    await getTopStories.call(
      (list) => _addTopStories(list), 
      (error) => topStories.sink.addError(error)
    );
  }

  @override
  void dispose() async {
    await topStories.close();
  }

}