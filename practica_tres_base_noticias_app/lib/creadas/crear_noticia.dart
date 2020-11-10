import 'package:flutter/material.dart';
import 'package:noticias/creadas/bloc/creadas_bloc.dart';
import 'package:noticias/models/noticia.dart';

class CrearNoticia extends StatelessWidget {
  final CreadasBloc bloc;
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  CrearNoticia({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear noticia'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Titulo:'),
                  TextField(
                    controller: _tituloController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Descripción:'),
                  TextField(
                    controller: _descripcionController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Content:'),
                  TextField(
                    controller: _contentController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                child: Text('Cargar'),
                onPressed: () {
                  var noticia = Noticia(
                      source: null,
                      author: 'User',
                      title: _tituloController.text,
                      description: _descripcionController.text,
                      url: '',
                      urlToImage: '',
                      publishedAt: '',
                      content: _contentController.text);
                  bloc.add(CreateNewEvent(noticia: noticia));
                  _tituloController.clear();
                  _descripcionController.clear();
                  _contentController.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
