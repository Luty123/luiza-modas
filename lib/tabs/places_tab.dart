import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/helpers/loader.dart';
import 'package:loja/tiles/place_tile.dart';

//Classe para exibir a tela contendo as informações da loja
class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("placers").get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: Loader(),
          );
        else
          return ListView(
            children: snapshot.data.docs.map((doc) => PlaceTile(doc)).toList(),
          );
      },
    );
  }
}
