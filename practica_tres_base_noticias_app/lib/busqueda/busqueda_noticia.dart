import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/noticias/bloc/noticias_bloc.dart';
import 'package:noticias/noticias/item_noticia.dart';

class BusquedaNoticia extends StatefulWidget {
  final NoticiasBloc bloc;
  const BusquedaNoticia({Key key, this.bloc}) : super(key: key);

  @override
  _BusquedaNoticiaState createState() => _BusquedaNoticiaState();
}

class _BusquedaNoticiaState extends State<BusquedaNoticia> {
  NoticiasBloc _bloc;
  final TextEditingController _searchController = TextEditingController();

  Future<dynamic> _showDialog(BuildContext ctx) async {
    await showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Búsqueda por texto",
              style: Theme.of(ctx).accentTextTheme.headline4,
            ),
            content: TextField(
              controller: _searchController,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            actions: [
              FlatButton(
                child: Text("Buscar"),
                onPressed: () {
                  _bloc.add(
                    NoticiasBuscarEvent(
                      search: _searchController.text.toLowerCase(),
                    ),
                  );
                  _searchController.clear();
                  Navigator.of(ctx).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Busqueda'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showDialog(context);
            },
          )
        ],
      ),
      body: Container(
        child: BlocProvider(
          create: (context) {
            _bloc = widget.bloc;
            return _bloc;
          },
          child: BlocConsumer<NoticiasBloc, NoticiasState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NoticasBuscarResultState) {
                return ListView.builder(
                  itemCount: state.noticias.length,
                  itemBuilder: (context, idx) {
                    return ItemNoticia(
                      noticia: state.noticias[idx],
                    );
                  },
                );
              }
              return Container(
                child: Center(
                  child: Text('No hay resultados :('),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
