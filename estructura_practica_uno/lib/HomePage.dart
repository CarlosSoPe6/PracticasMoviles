import 'package:estructura_practica_1/theme/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        backgroundColor: coffePrimary,
        body: Container(
            padding: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 1.0),
            child: Column(children: [
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 50.0),
                child: Image.asset('images/cupping.png'),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(1.0, 30.0, 1.0, 10.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: Theme(
                          data: Theme.of(context),
                          child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text("Registrate", style: Theme.of(context).accentTextTheme.bodyText2,),
                      )))),
              Container(
                  padding: EdgeInsets.fromLTRB(1.0, 30.0, 1.0, 10.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: Theme(
                          data: Theme.of(context),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text("Ingresa", style: Theme.of(context).accentTextTheme.bodyText2,),
                          ))))
            ])),
      ),
    );
  }
}
