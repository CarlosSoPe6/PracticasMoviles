import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  bool liked;
  @override
  void initState() {
    super.initState();
    liked = widget.grain.liked;
  }
  @override
  Widget build(BuildContext context) {
    IconData likedIcon = liked ? Icons.favorite : Icons.favorite_border;
    return buildGenericContainer(
        likedIcon,
        widget.grain.productTitle,
        widget.grain.productDescription,
        widget.grain.productImage,
        '/grains/details',
        context,
        widget.grain,
        () {
          widget.grain.liked = !liked;
          setState(() {
            liked = !liked;
          });
        });
  }
}
