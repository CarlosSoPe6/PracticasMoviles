import 'package:estructura_practica_1/theme/colors.dart';
import 'package:estructura_practica_1/utils/FormPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
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
                buildTextField(context, text: 'Correo'),
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
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text("Registrate", style: Theme.of(context).accentTextTheme.bodyText2,),
                      )))),
                buildTextField(context,
                    text: '¿Ya tienes una cuenta?', align: TextAlign.center),
                buildTextField(context,
                    text: 'INGRESA', align: TextAlign.center)
              ]))
            ]))
      ),
    );
  }
}
