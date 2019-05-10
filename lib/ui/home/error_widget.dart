import 'package:flutter/material.dart';
import 'package:hacker_news/ui/theme.dart';

class ErrorWidget extends StatelessWidget {
  final String _error;

  const ErrorWidget({
    Key key,
    @required String error,
  }) : _error = error, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("$_error", 
            textAlign: TextAlign.center, 
            style: regularText.copyWith(color: Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}