import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
        leading: BackButton(color: Colors.white),
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            buildMethod(context, "Tarjeta de crédito", Icons.payment),
            buildMethod(context, "PayPal", Icons.payment),
            buildMethod(context, "Tarjeta de regalo", Icons.payment)
          ]),
        ),
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext ctx) async {
    await showDialog(
        context: ctx,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "¡Orden exitosa!",
              style: Theme.of(ctx).accentTextTheme.headline4,
            ),
            content: Text(
                "Para más información busca en la opción histporial en tu perfil",
                style: Theme.of(ctx).accentTextTheme.bodyText2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            actions: [
              FlatButton(
                child: Text("ACEPTAR"),
                onPressed: () {
                  Navigator.of(ctx)
                      .popUntil((route) => route.settings.name == '/home');
                },
              )
            ],
          );
        });
  }

  Container buildMethod(BuildContext context, String title, IconData icon) {
    return Container(
        height: 220,
        padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
        child: GestureDetector(
          onTap: () {
            _showDialog(context);
          },
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
                        child: Icon(icon)),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width - 70) / 2,
                        height: MediaQuery.of(context).size.height / 3.0,
                        child: Center(
                            child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
                        ))),
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
