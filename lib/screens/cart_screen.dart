import 'package:flutter/material.dart';
import 'package:loja/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu carrinho"),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            alignment: Alignment.center,
            child: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                int p = model
                    .products.length; // Variavel para pegar o tamanho da lista
                // Se p for nulo retorn 0, caso contrario, retorna p
                // Se p = 1, mostra ITEM, se for maior que 1, retorna ITENS
                return Text(
                  "${p ?? 0}  ${p == 1 ? "ITEM" : "ITENS"}",
                  style: TextStyle(fontSize: 17.0),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
