import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    bool liked = widget.drink.liked;
    IconData likedIcon = Icons.favorite_border;
    if (liked) {
      likedIcon = Icons.favorite;
    }
    return buildGenericContainer(
        likedIcon,
        widget.drink.productTitle,
        widget.drink.productDescription,
        widget.drink.productImage,
        '/hot-drinks/details',
        context,
        widget.drink,
        () {
          setState(() {widget.drink.liked = !widget.drink.liked;});
        });
  }
}
