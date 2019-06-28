import 'package:flutter/material.dart';

// colors
Color colorOrange = const Color(0xFFd67226);
Color colorLigthBeige = const Color(0xFFefecca);
Color colorLightBlueGrey = const Color(0xFFa9cbb7);
Color colorYellow = const Color(0xFFf7ff58);
Color colorDarkGrey = const Color(0xFF5e565a);

// textstyles
TextStyle smallText = TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle regularText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle bigText = TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle biggerText = TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');
TextStyle biggestText = TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400, fontFamily: 'Open Sans');

final ThemeData theme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = new ThemeData(fontFamily: 'Open Sans');

  return base.copyWith(
    platform: TargetPlatform.android,
    brightness: Brightness.light,
    accentColor: colorYellow,
    primaryColor: colorOrange,
    primaryColorDark: Colors.red,
    cardColor: Colors.red,
    hintColor: colorLigthBeige,
    iconTheme: _customIconTheme(base.iconTheme),
    highlightColor: colorYellow,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: _buildButtonThemeData(base.buttonTheme),
    textTheme: _buildTextTheme(base.textTheme),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
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
    buttonColor: colorDarkGrey,
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
      color: colorDarkGrey
    ),
    body1: base.body1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: colorDarkGrey
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
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
  return original.copyWith(color: colorLightBlueGrey);
}