import 'package:flutter/material.dart';
import 'package:noticias/busqueda/busqueda_noticia.dart';
import 'package:noticias/creadas/bloc/creadas_bloc.dart';
import 'package:noticias/creadas/mis_noticias.dart';
import 'package:noticias/creadas/crear_noticia.dart';
import 'package:noticias/noticias/noticias.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CreadasBloc _creadasBloc = CreadasBloc();

  final _bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.article,
      ),
      label: "Inicio",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: "Buscar",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.create,
      ),
      label: "Añadir",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.description,
      ),
      label: "Ver creadas",
    ),
  ];

  dynamic _pagesList;

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    _creadasBloc.add(FetchNewsEvent());
    _pagesList = [
      Noticias(),
      BusquedaNoticia(),
      CrearNoticia(bloc: _creadasBloc),
      MisNoticias(bloc: _creadasBloc),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.black87,
        showSelectedLabels: false,
        items: _bottomTabs,
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
      ),
    );
  }
}
