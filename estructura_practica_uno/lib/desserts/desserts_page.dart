import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDessert> dessertList;

  DessertsPage({
    Key key,
    @required this.dessertList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Postres", context, backbutton: true),
      body: ListView.builder(
        itemCount: dessertList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDessert(
            dessert: dessertList[index],
          );
        },
      ),
    );
  }
}
