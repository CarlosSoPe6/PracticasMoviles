import 'package:flutter/material.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/noticias/item_noticia.dart';

class NoticiaNegocios extends StatefulWidget {
  final List<Noticia> noticias;
  NoticiaNegocios({Key key, @required this.noticias}) : super(key: key);

  @override
  _NoticiaNegociosState createState() => _NoticiaNegociosState();
}

class _NoticiaNegociosState extends State<NoticiaNegocios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: widget.noticias.length,
            itemBuilder: (ctx, idx) =>
                ItemNoticia(noticia: widget.noticias[idx]),
          ),
        ),
      ),
    );
  }
}
