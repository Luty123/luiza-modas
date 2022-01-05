import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

//Widget responsavel pela tela de resumo do pedido durante a fase para confirmar o pedido
class CartPrice extends StatefulWidget {
  final VoidCallback buy;
  CartPrice(this.buy);

  @override
  State<CartPrice> createState() => _CartPriceState();
}

class _CartPriceState extends State<CartPrice> {
  bool _switchVal = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child:
            ScopedModelDescendant<CartModel>(builder: (context, child, model) {
          double price = model.getProductsPrice();
          double discount = model.getDiscount();
          double ship = model.getShipPrice(_switchVal);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: MaterialColors.label,
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      //height: 150.0,
                      padding: EdgeInsets.all(16.0),
                      // width: 120.0,
                      child: Text(
                        'Retirar o produto na loja?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Switch(
                        onChanged: (bool value) {
                          setState(() {
                            this._switchVal = value;
                          });
                        },
                        value: this._switchVal,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Ao retirar o produto na loja, você não paga a entrega',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Resumo do pedido",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Subtotal"),
                  Text(
                    "R\$ ${price.toStringAsFixed(2)}",
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Desconto"),
                  Text(
                    "R\$ ${discount.toStringAsFixed(2)}",
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Entrega"),
                  Text(
                    "R\$ ${(ship).toStringAsFixed(2)}",
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "R\$ ${(price + ship - discount).toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16.0),
                  )
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                //Pergunta ao usuario se ele realmente deseja finalizar o pedido
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Deseja realmente finalizar o pedido?'),
                      content: Text(
                        'Ao clicar em SIM você confirma seu pedido',
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'NÂO'),
                          child: Text('NÂO'),
                          style: ElevatedButton.styleFrom(
                            primary: MaterialColors.label,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: widget.buy,
                          child: Text('SIM'),
                          style: ElevatedButton.styleFrom(
                            primary: MaterialColors.label,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                          ),
                        ),
                      ],
                    ),
                  ).then(
                    (value) {
                      if (value != null) {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Você selecionou $value'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
                child: Text(
                  "Finalizar pedido!",
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white, // Cor do texto
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
