import 'package:flutter/material.dart';

import '../models/noticia.dart';

class ItemNoticia extends StatelessWidget {
  final Noticia noticia;

  const ItemNoticia({Key key, this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(noticia.urlToImage);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  noticia.urlToImage != null ? noticia.urlToImage : "",
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        noticia.title != null ? noticia.title : "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        noticia.publishedAt != null
                            ? noticia.publishedAt
                            : "Fecha no disponible",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        noticia.description != null
                            ? noticia.description
                            : "Descripción no disponible",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        noticia.author != null
                            ? noticia.author
                            : "Autor no disponible",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
