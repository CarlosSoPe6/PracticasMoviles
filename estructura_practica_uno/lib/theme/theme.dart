import 'package:flutter/material.dart';
import 'colors.dart';

final borderDecorationStyle = new OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.zero),
    borderSide:
        BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid));

ThemeData buildCuppingTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: coffePrimary,
    accentColor: coffe8B8175,
    backgroundColor: coffeWhite,
    buttonColor: coffe8B8175,
    cardTheme: base.cardTheme.copyWith(
      color: coffe8B8175,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, side: BorderSide.none),
    ),
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: coffeFABF7C,
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, side: BorderSide.none)),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
        border: borderDecorationStyle,
        enabledBorder: borderDecorationStyle,
        focusedBorder: borderDecorationStyle),
    textTheme: buildCuppingTextTheme(base.textTheme),
    primaryTextTheme: buildCuppingTextTheme(base.primaryTextTheme),
    accentTextTheme: buildDarkTextTheme(base.accentTextTheme),
  );
}

TextTheme buildDarkTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline4: base.headline1
            .copyWith(fontWeight: FontWeight.w500, color: coffe121B22),
        caption: base.caption
            .copyWith(fontWeight: FontWeight.w200, color: coffe121B22),
        bodyText1: base.bodyText1
            .copyWith(fontWeight: FontWeight.w400, fontSize: 16.0),
        bodyText2: base.headline4
            .copyWith(
              fontWeight: FontWeight.w400, color: coffe121B22
            ),
      )
      .apply(
        fontFamily: 'AkzidenzGrotesk',
        displayColor: coffe121B22,
        bodyColor: coffe121B22,
      );
}

TextTheme buildCuppingTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline4: base.headline1
            .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        caption: base.caption
            .copyWith(fontWeight: FontWeight.w200, color: Colors.white),
        bodyText1: base.bodyText1
            .copyWith(fontWeight: FontWeight.w400, fontSize: 16.0),
        bodyText2: base.headline4
            .copyWith(
              fontWeight: FontWeight.w400, color: Colors.black
            )
      )
      .apply(
        fontFamily: 'AkzidenzGrotesk',
        displayColor: Colors.white,
        bodyColor: Colors.white,
      );
}
