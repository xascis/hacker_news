import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hacker_news/models/item.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/items/items_action.dart';
import 'package:hacker_news/redux/top_stories/top_stories_action.dart';
import 'package:hacker_news/redux/top_stories/top_stories_view_model.dart';
import 'package:hacker_news/ui/theme.dart';
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
              StoreConnector<AppState, TopStoriesViewModel>(
                onInit: (Store<AppState> store) => store.dispatch(FetchTopStoriesAction()),
                converter: TopStoriesViewModel.fromStore,
                builder: (BuildContext context, TopStoriesViewModel topStoriesViewModel) {
                  if (topStoriesViewModel.isLoading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator()
                      ),
                    );
                  }
                  if (topStoriesViewModel.error.isNotEmpty) {
                    return Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("${topStoriesViewModel.error}", 
                            textAlign: TextAlign.center, 
                            style: regularText.copyWith(color: Colors.grey[700]),
                          ),
                        ),
                      ),
                    );
                  }
                  if (topStoriesViewModel.topStories.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        controller: _scrollController,
                        itemCount: topStoriesViewModel.topStories.length,
                        itemBuilder: (BuildContext context, int index) {
                          int id = topStoriesViewModel.topStories[index];
                          return StoreConnector<AppState, Item>(
                            onInit: (Store<AppState> store) => store.dispatch(FetchItemAction(id)),
                            converter: (store) => store.state.items[id],
                            builder: (BuildContext context, Item item) {
                              if (item != null) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 15.0),
                                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10.0),
                                        height: 16.0,
                                        child: Text("${item.title}", style: regularText,),
                                      ),
                                      Container(
                                        height: 14.0,
                                        child: Text("${item.time}", style: smallText),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10.0),
                                      color: Colors.grey[400],
                                      height: 16.0,
                                    ),
                                    Container(
                                      color: Colors.grey[350],
                                      height: 14.0,
                                    ),
                                  ],
                                ),
                              );
                            }
                          );
                        }
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}