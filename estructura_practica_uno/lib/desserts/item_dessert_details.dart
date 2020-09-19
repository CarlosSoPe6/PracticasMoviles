import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/utils/AnyItem.dart';
import 'package:flutter/material.dart';

class DessertDetail extends StatelessWidget {
  DessertDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDessert dessert = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(dessert.productTitle)
      ),
      body: Container(
        child: buildGenericProductDetail(
              dessert.productTitle,
              dessert.productDescription,
              dessert.productImage,
              dessert.productPrice,
              dessert.liked,
              buildDessertSize(context, (val) {
                print(val);
              }),
              context,
              () {
                final item = ProductItemCart(
                  productImage: dessert.productImage,
                  productAmount: 1,
                  productDescription: dessert.productDescription,
                  productPrice: dessert.productPrice,
                  productTitle: dessert.productTitle,
                  typeOfProduct: ProductType.POSTRES
                );
                cart.add(item);
              }),
      ),
    );
  }
}
