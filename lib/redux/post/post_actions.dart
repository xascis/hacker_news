class LoadingPostAction {
  final bool isLoading;
  LoadingPostAction(this.isLoading);
}

class ShowPostAction {
  final bool isLoading;
  final List<int> posts;
  ShowPostAction(this.isLoading, this.posts);
}

class FetchPostAction {}
