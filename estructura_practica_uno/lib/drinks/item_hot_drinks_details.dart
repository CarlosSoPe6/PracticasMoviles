import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinkDetail extends StatefulWidget {
  HotDrinkDetail({
    Key key,
  }) : super(key: key);

  @override
  _HotDrinkDetailState createState() => _HotDrinkDetailState();
}

class _HotDrinkDetailState extends State<HotDrinkDetail> {
  @override
  Widget build(BuildContext context) {
    ProductHotDrinks drink = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(drink.productTitle),
      ),
      body: Container(
          child: buildGenericProductDetail(
              drink.productTitle,
              drink.productDescription,
              drink.productImage,
              drink.productPrice,
              drink.liked,
              buildDrinkSize(context, drink.productSize, (val) {
                setState(() {
                  drink.productSize = val;
                  drink.productPrice = drink.productPriceCalculator();
                });
              }),
              context,
              () {
                final item = ProductItemCart(
                  productAmount: 1,
                  productDescription: drink.productDescription,
                  productImage: drink.productImage,
                  productPrice: drink.productPrice,
                  productTitle: drink.productTitle,
                  typeOfProduct: ProductType.BEBIDAS
                );
                cart.add(item);
              })),
    );
  }
}
