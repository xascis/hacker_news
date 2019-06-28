import 'package:flutter/material.dart';
import 'package:hacker_news/presentation/common/theme.dart';

class SnackBarWidget {
  final String text;
  final SnackBarAction action;

  SnackBarWidget({@required this.text, this.action});

  void call(BuildContext context){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.lightBlue[900],
        content: Text(text, style: regularText.copyWith(color: Colors.white),),
        action: action,
      ),
    );
  }
}