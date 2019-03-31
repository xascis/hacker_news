class LoadingTopStoriesAction {
  final bool isLoading;
  LoadingTopStoriesAction(this.isLoading);
}

class ShowTopStoriesAction {
  final bool isLoading;
  final List<int> topStories;
  ShowTopStoriesAction(this.isLoading, this.topStories);
}


class ErrorTopStoriesAction {
  final String error;
  ErrorTopStoriesAction(this.error);
}

// without reducers
class FetchTopStoriesAction {}


