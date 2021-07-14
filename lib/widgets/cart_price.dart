import 'package:flutter/material.dart';
import 'package:loja/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:search_cep/search_cep.dart';

class CartPrice extends StatelessWidget {
  final VoidCallback buy;
  CartPrice(this.buy);

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
          double ship = model.getShipPrice();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                    "R\$ ${ship.toStringAsFixed(2)}",
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
                onPressed: buy,
                child: Text("Finalizar pedido!"),
                style: ElevatedButton.styleFrom(
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