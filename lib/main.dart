import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hacker_news/redux/app/app_state.dart';
import 'package:hacker_news/redux/store.dart';
import 'package:hacker_news/ui/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = createStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Hacker News',
        theme: ThemeData(primarySwatch: Colors.purple,),
        home: HomeScreen(),
      ),
    );
  }
}