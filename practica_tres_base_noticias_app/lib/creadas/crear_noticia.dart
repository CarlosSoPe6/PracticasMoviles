import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/creadas/bloc/creadas_bloc.dart';
import 'package:noticias/models/noticia.dart';

class CrearNoticia extends StatefulWidget {
  final CreadasBloc bloc;
  CrearNoticia({Key key, this.bloc}) : super(key: key);

  @override
  _CrearNoticiaState createState() => _CrearNoticiaState();
}

class _CrearNoticiaState extends State<CrearNoticia> {
  CreadasBloc _bloc;

  final TextEditingController _tituloController = TextEditingController();

  final TextEditingController _descripcionController = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear noticia'),
      ),
      body: BlocProvider(
        create: (context) {
          _bloc = widget.bloc..add(FetchNewsEvent());
          return _bloc;
        },
        child: BlocConsumer<CreadasBloc, CreadasState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
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
                        _bloc.add(CreateNewEvent(noticia: noticia));
                        _tituloController.clear();
                        _descripcionController.clear();
                        _contentController.clear();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
