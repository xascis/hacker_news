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
                        padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                  height: MediaQuery.of(context).size.height * 0.13,
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          margin: const EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: colorOrange, width: 1.0)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.arrow_drop_up, color: colorOrange),
                                              Text("${item.score}", style: smallText,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 8,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("${item.title}", maxLines: 2, overflow: TextOverflow.ellipsis, style: regularText,),
                                              Text("${item.time}", style: smallText),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          color: colorLigthBeige,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.comment,color: colorLightBlueGrey,),
                                              Text("${item?.kids?.length}", style: smallText)
                                            ],
                                          ),
                                        ),
                                      )
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
                                      height: 17.0,
                                    ),
                                    Container(
                                      color: Colors.grey[350],
                                      height: 15.0,
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