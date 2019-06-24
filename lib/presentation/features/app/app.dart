import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/data/api_provider.dart';
import 'package:hacker_news/data/repository.dart';
import 'package:hacker_news/presentation/features/app/app_bloc.dart';
import 'package:hacker_news/presentation/features/home/home_screen.dart';
import 'package:hacker_news/presentation/theme.dart';
import 'package:http/http.dart';

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