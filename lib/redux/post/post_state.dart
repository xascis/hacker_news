import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final bool isLoading;
  final List<int> posts;

  PostState({@required this.isLoading, @required this.posts});

  factory PostState.initial() {
    return PostState(
      isLoading: true,
      posts: [],
    );
  }

  PostState copyWith({bool isLoading, List<int> posts}) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }

  @override
	String toString() {
		return 'PostState{isLoading: $isLoading, posts: $posts}';
	}
}