import 'package:bloc_provider/bloc_provider.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc implements Bloc {
  final Repository repository;

  AppBloc(this.repository) {
    fetchTopStories();
  }


  final topStories = BehaviorSubject<List<int>>();
  // Observable<List<int>> get topStories => topStories.stream;
  Function(List<int>) get _addTopStories => topStories.sink.add;

  

  void fetchTopStories() async {
    await repository.fetchTopStories().then(
      (response) => _addTopStories(response),
    ).catchError(
      (e) => topStories.sink.addError("$e"),
    );
  }

  @override
  void dispose() async {
    await topStories.close();
  }

}