import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/data/repository_imp.dart';
import 'package:hacker_news/data/sources/remote/api_services.dart';
import 'package:hacker_news/domain/usecases/get_top_stories.dart';
import 'package:hacker_news/presentation/features/app/app_bloc.dart';
import 'package:hacker_news/presentation/features/home/home_screen.dart';
import 'package:hacker_news/presentation/common/theme.dart';

class App extends StatelessWidget {
  final repositoryImp = RepositoryImp(apiServices);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: theme,
      home: BlocProvider<AppBloc>(
        creator: (BuildContext context, BlocCreatorBag bag) => AppBloc(GetTopStories(repositoryImp)),
        child: HomeScreen(),
      ),
    );
  }
}