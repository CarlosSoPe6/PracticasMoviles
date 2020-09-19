import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final int index;
  final ValueChanged<double> onAmountUpdated;
  final dynamic onRemoveProd;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.onRemoveProd,
    @required this.product,
    @required this.index
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(24),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: (MediaQuery.of(context).size.width - 58) / 3,
            child: Image.network(widget.product.productImage,
                fit: BoxFit.fitHeight),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: (MediaQuery.of(context).size.width - 58) * (2.0 / 3.0),
            child: Column(
              children: [
                Text("${widget.product.productTitle}", style: Theme.of(context).accentTextTheme.headline4, textAlign: TextAlign.left,),
                SizedBox(
                  height: 12,
                ),
                Text("${widget.product.productDescription}", style: Theme.of(context).accentTextTheme.bodyText2, textAlign: TextAlign.left,),
                Row(children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                Text("${widget.product.productAmount}", style: Theme.of(context).accentTextTheme.bodyText2),
                IconButton(
                    icon: Icon(Icons.remove_circle), onPressed: _remProd),
                Text("\$${widget.product.productPrice}", style: Theme.of(context).accentTextTheme.headline6,),
                IconButton(
                    icon: Icon(Icons.delete), onPressed: _delProd),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }

  void _delProd() {
    widget.onRemoveProd(widget.index, widget.product.productPrice * widget.product.productAmount);
  }
}
