import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/bloc/app_bloc.dart';
import 'package:hacker_news/resources/api_provider.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:hacker_news/ui/home/home_screen.dart';
import 'package:hacker_news/ui/theme.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final client = Client();
  static final apiProvider = ApiProvider(client);
  static final repository = Repository(apiProvider);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: theme,
      home: BlocProvider<AppBloc>(
        creator: (BuildContext context, BlocCreatorBag bag) => AppBloc(repository),
        child: HomeScreen(),
      ),
    );
  }
}