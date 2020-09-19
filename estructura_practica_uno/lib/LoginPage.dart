import 'package:estructura_practica_1/theme/colors.dart';
import 'package:estructura_practica_1/utils/FormPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
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
                  child: buildFormPageFrom([
                buildTextField(context, text: 'Nombre completo'),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none),
                ),
                buildTextField(context, text: 'Password'),
                TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(1.0, 30.0, 1.0, 10.0),
                    child: SizedBox(
                        width: double.infinity,
                        child: Theme(
                          data: Theme.of(context),
                          child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text("ENTRAR", style: Theme.of(context).accentTextTheme.bodyText2,),
                        )))),
                buildTextField(context,
                    text: '¿Olvidaste tu password?', align: TextAlign.center)
              ]))
            ])),
      ),
    );
  }
}
