import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';

//Classe responsavel pela tela de notificação do pedido feito com sucesso
class OrderScreen extends StatelessWidget {
  final String orderId;
  OrderScreen(this.orderId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pedido realizado!"),
          centerTitle: true,
          backgroundColor: MaterialColors.signStartGradient,
        ),
        //Apos o pedido ser realizado com sucesso
        body: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(32.0),
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/assets%2Fverificado-1.png?alt=media&token=f314d5b4-5d18-4c8d-acd4-34e665dad784'),
              ),
              Text(
                "Pedido realizado com sucesso!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                "Verifique o status do seu pedido em:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              Text(
                "MEUS PEDIDOS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Código do pedido: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              //Obten o id do pedido e mostra ao usuario
              Text(
                "$orderId",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: MaterialColors.active),
              )
            ],
          ),
        ));
  }
}
