import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/item_dessert_details.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'checkout.dart';
import 'desserts/desserts_page.dart';
import 'drinks/hot_drinks_page.dart';
import 'drinks/item_hot_drinks_details.dart';
import 'grains/grains_page.dart';
import 'home/home.dart';
import 'models/product_grains.dart';

Route<dynamic> buildRouter(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => HomePage(),
        fullscreenDialog: true,
      );
    case '/login':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true,
      );
    case '/register':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => RegisterPage(),
        fullscreenDialog: true,
      );
    case '/cart':
      List<ProductItemCart> args = settings.arguments;
      return MaterialPageRoute<void>(        
        settings: settings,
        builder: (BuildContext context) => Cart(productsList: args),
        fullscreenDialog: true,
      );
    case '/checkout':
      return MaterialPageRoute<void>(        
        settings: settings,
        builder: (BuildContext context) => Checkout(),
        fullscreenDialog: true,
      );
    case '/home':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => Home(title: APP_TITLE),
        fullscreenDialog: true,
      );
    case '/hot-drinks':
    List<ProductHotDrinks> args = settings.arguments;
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => HotDrinksPage(drinksList: args,),
        fullscreenDialog: true,
      );
    case '/hot-drinks/details':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => HotDrinkDetail(),
        fullscreenDialog: true,
      );
    case '/grains':
      List<ProductGrains> args = settings.arguments;
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => GrainsPage(grainList: args,),
        fullscreenDialog: true,
      );
    case '/grains/details':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => GrainsDetail(),
        fullscreenDialog: true,
      );
    case '/desserts':
      List<ProductDessert> args = settings.arguments;
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => DessertsPage(dessertList: args,),
        fullscreenDialog: true,
      );
    case '/desserts/details':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => DessertDetail(),
        fullscreenDialog: true,
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
