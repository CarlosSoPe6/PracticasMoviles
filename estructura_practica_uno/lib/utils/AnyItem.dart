import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container buildGenericContainer(
    IconData likedIcon,
    String title,
    String description,
    String image,
    String route,
    BuildContext context,
    Object routeParam,
    dynamic onAction) {
  return Container(
    height: 220,
    padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
    child: Stack(
      children: [
        Positioned.fill(
            top: 16,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(route, arguments: routeParam),
              child: Card(
                elevation: 4.0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: (MediaQuery.of(context).size.width - 70) *
                              (5 / 12),
                          height: MediaQuery.of(context).size.height / 3.0,
                          child: Center(
                              child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).accentTextTheme.headline4,
                          ))),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width - 70) *
                              (5 / 12),
                          height: MediaQuery.of(context).size.height / 3.0,
                          child: Image.network(image, fit: BoxFit.fitHeight)),
                      IconButton(
                        icon: Icon(
                          likedIcon,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          onAction();
                        },
                      ),
                    ]),
              ),
            )),
      ],
    ),
  );
}

Row buildDrinkSize(BuildContext ctx, ProductSize s, dynamic onAction) {
  return Row(
    children: [
      ChoiceChip(
        label: Text("Chico", style: Theme.of(ctx).accentTextTheme.caption),
        selected: s == ProductSize.CH,
        onSelected: (bool selected) {
          onAction(ProductSize.CH);
        },
      ),
      ChoiceChip(
        label: Text("Mediano", style: Theme.of(ctx).accentTextTheme.caption),
        selected: s == ProductSize.M,
        onSelected: (bool selected) {
          onAction(ProductSize.M);
        },
      ),
      ChoiceChip(
        label: Text("Grande", style: Theme.of(ctx).accentTextTheme.caption),
        selected: s == ProductSize.G,
        onSelected: (bool selected) {
          onAction(ProductSize.G);
        },
      ),
    ],
  );
}

Row buildGrainSize(BuildContext ctx, ProductWeight w, dynamic onAction) {
  return Row(
    children: [
      ChoiceChip(
        label: Text("Cuarto", style: Theme.of(ctx).accentTextTheme.caption),
        selected: w == ProductWeight.CUARTO,
        onSelected: (bool selected) {
          onAction(ProductWeight.CUARTO);
        },
      ),
      ChoiceChip(
        label: Text("Kilo", style: Theme.of(ctx).accentTextTheme.caption),
        selected: w == ProductWeight.KILO,
        onSelected: (bool selected) {
          onAction(ProductWeight.KILO);
        },
      ),
    ],
  );
}

Row buildDessertSize(BuildContext ctx, dynamic onAction) {
  return Row(
    children: [],
  );
}

Container buildGenericProductDetail(
    String title,
    String description,
    String image,
    double cost,
    bool liked,
    Row sizeOptions,
    BuildContext context,
    dynamic onAction) {
  return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 5.0),
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width - 70,
          child: Stack(
            children: [
              Image.network(image),
              IconButton(
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  liked = !liked;
                },
              )
            ],
          ),
        ),
        Container(
            child: Text(
          title,
          style: Theme.of(context).accentTextTheme.headline4,
          textAlign: TextAlign.left,
        )),
        Text(description,
            style: Theme.of(context).accentTextTheme.bodyText1,
            textAlign: TextAlign.left),
        Row(children: [
          Container(child: sizeOptions),
          Container(
              child: Text(cost.toInt().toString(),
                  style: Theme.of(context).accentTextTheme.headline4,
                  textAlign: TextAlign.right,)),
        ]),
        Row(children: [
          Container(
              width: (MediaQuery.of(context).size.width - 70) / 2,
              padding: EdgeInsets.fromLTRB(1.0, 1.0, 2.0, 1.0),
              child: Theme(
                  data: Theme.of(context),
                  child: RaisedButton(
                    onPressed: () {onAction();},
                    child: Text(
                      "AGREGAR AL CARRITO",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ))),
          Container(
              width: (MediaQuery.of(context).size.width - 70) / 2,
              padding: EdgeInsets.fromLTRB(2.0, 1.0, 1.0, 1.0),
              child: Theme(
                  data: Theme.of(context),
                  child: RaisedButton(
                    onPressed: () {Navigator.of(context).pushNamed('/checkout');},
                    child: Text(
                      "COMPRAR AHORA",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ))),
        ])
      ]));
}

AppBar buildAppBar(String title, BuildContext context,
    {bool backbutton = false}) {
  if (backbutton) {
    return AppBar(
      title: Text(title),
      leading: BackButton(color: Colors.white),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart', arguments: cart);
          },
        )
      ],
    );
  }
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).pushNamed('/cart', arguments: cart);
        },
      )
    ],
  );
}
