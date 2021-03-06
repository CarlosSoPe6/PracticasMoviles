import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/secrets.dart';

part 'noticias_event.dart';
part 'noticias_state.dart';

class NoticiasBloc extends Bloc<NoticiasEvent, NoticiasState> {
  final _sportsLink =
      "https://newsapi.org/v2/top-headlines?country=mx&category=sports&$apiKey";
  final _businessLink =
      "https://newsapi.org/v2/top-headlines?country=mx&category=business&$apiKey";
  NoticiasBloc() : super(NoticiasInitial());

  @override
  Stream<NoticiasState> mapEventToState(
    NoticiasEvent event,
  ) async* {
    if (event is GetNewsEvent) {
      // yield lista de noticias al estado
      try {
        List<Noticia> soportsNews = await _requestSportNoticias();
        List<Noticia> businessNews = await _requestBusinessNoticias();

        yield NoticiasSuccessState(
          noticiasSportList: soportsNews,
          noticiasBusinessList: businessNews,
        );
      } catch (e) {
        yield NoticiasErrorState(message: "Error al cargar noticias: $e");
      }
    }
    if (event is NoticiasBuscarEvent) {
      String search = event.search.toLowerCase();
      try {
        List<Noticia> soportsNews = await _requestSportNoticias();
        List<Noticia> businessNews = await _requestBusinessNoticias();
        List<Noticia> merge = List<Noticia>();
        merge.addAll(soportsNews);
        merge.addAll(businessNews);
        var result = merge.where((element) {
          var title = element.title;
          var desc = element.description;
          var content = element.content;
          if (title != null && title.toLowerCase().contains(search)) {
            return true;
          }
          if (desc != null && desc.toLowerCase().contains(search)) {
            return true;
          }
          if (content != null && content.toLowerCase().contains(search)) {
            return true;
          }
          return false;
        }).toList();
        yield NoticasBuscarResultState(noticias: result);
      } catch (e) {
        yield NoticiasErrorState(message: "Error al cargar noticias: $e");
      }
    }
  }

  Future<List<Noticia>> _requestBusinessNoticias() async {
    Response response = await get(_businessLink);
    List<Noticia> _noticiasList = List();

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)["articles"];
      _noticiasList =
          ((data).map((element) => Noticia.fromJson(element))).toList();
    }
    return _noticiasList;
  }

  Future<List<Noticia>> _requestSportNoticias() async {
    Response response = await get(_sportsLink);
    List<Noticia> _noticiasList = List();

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)["articles"];
      _noticiasList =
          ((data).map((element) => Noticia.fromJson(element))).toList();
    }
    return _noticiasList;
  }
}
