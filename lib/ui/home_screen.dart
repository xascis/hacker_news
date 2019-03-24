import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/post/post_actions.dart';
import 'package:hacker_news/redux/post/post_view_model.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text("Column"),
              StoreConnector<AppState, PostViewModel>(
                onInit: (Store<AppState> store) {
                  store.dispatch(FetchPostAction());
                },
                converter: PostViewModel.fromStore,
                builder: (BuildContext context, PostViewModel viewModel) {
                  if (viewModel.isLoading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator()
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      controller: _scrollController,
                      itemCount: viewModel.posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Text("${viewModel.posts[index]}"),
                        );
                      }
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}