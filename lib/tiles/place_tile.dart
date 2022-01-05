// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:url_launcher/url_launcher.dart';

//Classe responsavel pelos elementos que serão exibidos na tela de informações da Loja
class PlaceTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  PlaceTile(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            //Exibe a imagem da loja
            height: 200.0,
            child: Image.network(
              snapshot.data()["image"],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: MaterialColors.signEndGradient),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  //Exibe o nome da loja
                  snapshot.data()["title"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white),
                ),
                Text(
                  //Exibe o endereço da loja
                  snapshot.data()["address"],
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            /*Exibe a geolocalização do enredeço da loja pegando os
            parametros de latitude e longitude passados no firebase - Utiliza o google maps*/
            decoration: BoxDecoration(color: MaterialColors.signEndGradient),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    launch(
                        "https://www.google.com/maps/search/?api=1&query=${snapshot.data()["lat"]},"
                        "${snapshot.data()["long"]}");
                  },
                  child: Text(
                    "Ver no Mapa",
                    style: TextStyle(fontSize: 16),
                  ),
                  textColor: Colors.amber,
                  padding: EdgeInsets.zero,
                ),
                FlatButton(
                  /*Acessa nativamente a chamada do dispositivo, passando como parametro
                  o numero de telefone indicado*/
                  onPressed: () {
                    launch("tel:${snapshot.data()["phone"]}");
                  },
                  child: Text(
                    "Ligar",
                    style: TextStyle(fontSize: 16),
                  ),
                  textColor: Colors.amber,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
