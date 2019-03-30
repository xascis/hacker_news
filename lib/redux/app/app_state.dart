import 'package:equatable/equatable.dart';
import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/top_stories/top_stories_state.dart';

class AppState extends Equatable {
  final Map<int, Item> items; // ItemState ??
  final TopStoriesState topStoriesState;
  // final NewStoriesState newStoriesState;

  AppState({this.items, this.topStoriesState});

  factory AppState.initial() {
    return AppState(
      items: {},
      topStoriesState: TopStoriesState.initial(),
    );
  }

	AppState copyWith({List<Item> items, TopStoriesState topStoriesState}) {
		return AppState(
      items: items ?? this.items,
			topStoriesState: topStoriesState ?? this.topStoriesState,
		);
	}

	@override
	String toString() {
		return 'AppState{items: $items, topStoriesState: $topStoriesState}';
	}
}