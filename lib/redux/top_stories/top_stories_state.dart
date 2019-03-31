import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class TopStoriesState extends Equatable {
  final bool isLoading;
  final List<int> topStories;
  final String error;

  TopStoriesState({@required this.isLoading, @required this.topStories, @required this.error});

  factory TopStoriesState.initial() {
    return TopStoriesState(
      isLoading: false,
      topStories: [],
      error: "",
    );
  }

  TopStoriesState copyWith({bool isLoading, List<int> topStories, String error}) {
    return TopStoriesState(
      isLoading: isLoading ?? this.isLoading,
      topStories: topStories ?? this.topStories,
      error: error ?? this.error,
    );
  }

  @override
	String toString() {
		return 'TopStoriesState{isLoading: $isLoading, topStories: $topStories, error: $error}';
	}
}