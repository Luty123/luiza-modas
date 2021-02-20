import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
// Gradiente da home
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );
// Barra flutuante
    return Stack(
      //
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                floating: true,
                pinned: false,
                snap: true, //false
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text("Novidades"),
                  centerTitle: true,
                )),
// Importando imagens do firebase
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection("home")
                  .orderBy("posicao")
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.docs.map((doc) {
                      return StaggeredTile.count(
                          doc.data()["x"], doc.data()["y"]);
                    }).toList(),
                    children: snapshot.data.docs.map((doc) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.data()["image"],
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  );
              },
            )
          ],
        )
      ],
    );
  }
}
