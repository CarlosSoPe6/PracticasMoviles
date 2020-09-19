import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
        leading: BackButton(color: Colors.white),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                    onAmountUpdated: _priceUpdate,
                    onRemoveProd: _deleteItem,
                    product: widget.productsList[index],
                    index: index);
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Total: \$$_total",
                    style: Theme.of(context).accentTextTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                  child: Text(
                    "Pagar",
                    style: Theme.of(context).accentTextTheme.bodyText2,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/checkout');
                  },
                ),),)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }

  void _deleteItem(int idx, double itemPrice) {
    print(idx);
    setState(() {
      cart.removeAt(idx);
      _total += -itemPrice;
    });
  }
}
