import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';

class ItemDessert extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessert({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertState createState() => _ItemDessertState();
}

class _ItemDessertState extends State<ItemDessert> {
  @override
  Widget build(BuildContext context) {
    IconData likedIcon = Icons.favorite_border;
    if (widget.dessert.liked) {
      likedIcon = Icons.favorite;
    }
    return buildGenericContainer(
        likedIcon,
        widget.dessert.productTitle,
        widget.dessert.productDescription,
        widget.dessert.productImage,
        '/desserts/details',
        context,
        widget.dessert,
        () => {
          setState(() => {
            widget.dessert.liked = !widget.dessert.liked
          })
        });
  }
}
