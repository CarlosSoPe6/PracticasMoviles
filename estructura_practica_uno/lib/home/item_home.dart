import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  final String title;
  final String image;
  ItemHome({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 16,
            child: Card(
              elevation: 4.0,
              child: Row(children: [
                SizedBox(
                    width: (MediaQuery.of(context).size.width - 70) / 2,
                    height: MediaQuery.of(context).size.height / 3.0,
                    child: 
                    Center(
                      child: Text(
                      this.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).accentTextTheme.headline4,
                    ))),
                SizedBox(
                    width: (MediaQuery.of(context).size.width - 70) / 2,
                    height: MediaQuery.of(context).size.height / 3.0,
                    child: Image.network(this.image, fit: BoxFit.contain)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
