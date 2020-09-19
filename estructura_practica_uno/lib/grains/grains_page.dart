import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainList;

  GrainsPage({
    Key key,
    @required this.grainList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Granos", context, backbutton: true),
      body: ListView.builder(
        itemCount: grainList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grainList[index],
          );
        },
      ),
    );
  }
}
