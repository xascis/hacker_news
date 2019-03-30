class LoadingTopStoriesAction {
  final bool isLoading;
  LoadingTopStoriesAction(this.isLoading);
}

class ShowTopStoriesAction {
  final bool isLoading;
  final List stories;
  ShowTopStoriesAction(this.isLoading, this.stories);
}


class ErrorTopStoriesAction {
  final String error;
  ErrorTopStoriesAction(this.error);
}

// without reducers
class FetchTopStoriesAction {}


