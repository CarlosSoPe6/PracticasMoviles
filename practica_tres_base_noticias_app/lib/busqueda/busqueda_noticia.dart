import 'package:flutter/material.dart';

class BusquedaNoticia extends StatefulWidget {
  const BusquedaNoticia({Key key}) : super(key: key);

  @override
  _BusquedaNoticiaState createState() => _BusquedaNoticiaState();
}

class _BusquedaNoticiaState extends State<BusquedaNoticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Crear noticia"),
      ),
    );
  }
}
