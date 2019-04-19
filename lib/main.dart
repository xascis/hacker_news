import 'package:flutter/material.dart';
import 'package:hacker_news/ui/home_screen.dart';
import 'package:hacker_news/ui/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: theme,
      home: HomeScreen(),
    );
  }
}