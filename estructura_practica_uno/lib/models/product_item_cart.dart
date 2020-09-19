import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  String productImage;
  String productDescription;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productImage,
    @required this.productDescription,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
  });
}

final List<ProductItemCart> cart = List();

