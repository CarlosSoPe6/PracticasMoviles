import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';

class GrainsDetail extends StatefulWidget {
  GrainsDetail({
    Key key,
  }) : super(key: key);

  @override
  _GrainsDetailState createState() => _GrainsDetailState();
}

class _GrainsDetailState extends State<GrainsDetail> {
  @override
  Widget build(BuildContext context) {
    ProductGrains grain = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(grain.productTitle),
      ),
      body: Container(
        child: buildGenericProductDetail(
              grain.productTitle,
              grain.productDescription,
              grain.productImage,
              grain.productPrice,
              grain.liked,
              buildGrainSize(context, grain.productWeight, (val) {
                setState(() {
                  grain.productWeight = val;
                  grain.productPrice = grain.productPriceCalculator();
                });
              }),
              context,
              () {
                final item = ProductItemCart(
                  productAmount: 1,
                  productDescription: grain.productDescription,
                  productImage: grain.productImage,
                  productPrice: grain.productPrice,
                  productTitle: grain.productTitle,
                  typeOfProduct: ProductType.GRANO
                );
                cart.add(item);
              }),
      ),
    );
  }
}
