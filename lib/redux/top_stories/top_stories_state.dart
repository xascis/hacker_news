import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class TopStoriesState extends Equatable {
  final bool isLoading;
  final List stories;
  final String error;

  TopStoriesState({@required this.isLoading, @required this.stories, @required this.error});

  factory TopStoriesState.initial() {
    return TopStoriesState(
      isLoading: false,
      stories: [],
      error: "",
    );
  }

  TopStoriesState copyWith({bool isLoading, List stories, String error}) {
    return TopStoriesState(
      isLoading: isLoading ?? this.isLoading,
      stories: stories ?? this.stories,
      error: error ?? this.error,
    );
  }

  @override
	String toString() {
		return 'TopStoriesState{isLoading: $isLoading, stories: $stories, error: $error}';
	}
}