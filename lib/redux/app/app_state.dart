import 'package:equatable/equatable.dart';

import 'package:hacker_news/redux/post/post_state.dart';

class AppState extends Equatable {
  final PostState postState;

  AppState({this.postState});

  factory AppState.initial() {
    return AppState(
      postState: PostState.initial(),
    );
  }

	AppState copyWith({PostState postState}) {
		return AppState(
			postState: postState ?? this.postState,
		);
	}

	@override
	String toString() {
		return 'AppState{postState: $postState}';
	}
}