import 'package:flutter/material.dart';

// texto
Color colorTextBlue = Colors.blue[800];
Color colorTextGrey = Colors.grey[800];

final ThemeData themeData = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = new ThemeData(fontFamily: 'Open Sans');

  return base.copyWith(
    brightness: Brightness.light,
    accentColor: Colors.yellow,
    primaryColor: Colors.orange[50],
    primaryColorDark: Colors.yellow,
    cardColor: Colors.red,
    // indicatorColor: kAppColor1,
    hintColor: Colors.grey,
    iconTheme: _customIconTheme(base.iconTheme),
    highlightColor: Colors.yellow[200],
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: _buildButtonThemeData(base.buttonTheme),
    textTheme: _buildTextTheme(base.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      filled: false,
      hintStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Quicksand'),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      // labelStyle: TextStyle(color: kAppColor6,)
    ),
  );
}

ButtonThemeData _buildButtonThemeData(ButtonThemeData base){
  return base.copyWith(
    buttonColor: Colors.blue[800],
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    subhead: base.subhead.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: colorTextBlue
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: colorTextBlue
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      fontFamily: 'Quicksand'
    ),
    // others
    body2: base.body2.copyWith(
      color: Colors.red,
    ),
    title: base.title.copyWith(
      color: Colors.red,
    ),
    caption: base.caption.copyWith(
      color: Colors.red,
    ),
    display1: base.display1.copyWith(
      color: Colors.red,
    ),
    display2: base.display2.copyWith(
      color: Colors.red,
    ),
    display3: base.display3.copyWith(
      color: Colors.red,
    ),
    display4: base.display4.copyWith(
      color: Colors.red,
    ),
    headline: base.headline.copyWith(
      color: Colors.red,
    ),
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: Colors.green);
}

TextStyle smallText = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle regularText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle bigText = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle biggerText = TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle biggestText = TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');