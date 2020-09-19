import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/theme/colors.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _showShowSnack(String content) {
    final snack = SnackBar(
      content: Text(content),
    );
    _scaffoldKey.currentState.showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Anna Smith'),
            accountEmail: Text('user123@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.brown,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    'https://randomuser.me/api/portraits/women/65.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: coffePrimary,
            ),
          ),
          ListTile(
            title: Text(
              'Carrito de compras',
              style: Theme.of(context).accentTextTheme.bodyText2,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              'Lista de deseos',
              style: Theme.of(context).accentTextTheme.bodyText2,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              'Historial de compras',
              style: Theme.of(context).accentTextTheme.bodyText2,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text(
              'Configración',
              style: Theme.of(context).accentTextTheme.bodyText2,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      )),
      appBar: buildAppBar(widget.title, context),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
              onTap: _openGrainsPage,
              child: ItemHome(
                title: "Granos",
                image: "https://i.imgur.com/5MZocC1.png",
              )),
          GestureDetector(
              onTap: _openDessertsPage,
              child: ItemHome(
                title: "Postres",
                image: "https://i.imgur.com/fI7Tezv.png",
              )),
          GestureDetector(
              onTap: () {
                _showShowSnack("Proximamente");
              },
              child: ItemHome(
                title: "Tazas",
                image: "https://i.imgur.com/fMjtSpy.png",
              )),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.pushNamed(context, '/hot-drinks',
        arguments: ProductRepository.loadProducts(ProductType.BEBIDAS));
  }

  void _openGrainsPage() {
    Navigator.pushNamed(context, '/grains',
        arguments: ProductRepository.loadProducts(ProductType.GRANO));
  }

  void _openDessertsPage() {
    Navigator.pushNamed(context, '/desserts',
        arguments: ProductRepository.loadProducts(ProductType.POSTRES));
  }
}
