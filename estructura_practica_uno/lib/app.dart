import 'package:estructura_practica_1/router.dart';
import 'package:estructura_practica_1/theme/theme.dart';
import 'package:flutter/material.dart';

class CuppingApp extends StatelessWidget {
  final _theme = buildCuppingTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/',
      onGenerateRoute: buildRouter,
      theme: _theme,
    );
  }
}
