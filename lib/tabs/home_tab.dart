import 'dart:ui';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/assets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomeTab extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
// Gradiente da home
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            MaterialColors.signStartGradient,
            MaterialColors.signEndGradient,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );
// Barra flutuante
    return Stack(
      //
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              floating: true,
              pinned: false,
              snap: true, //false
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Destaques"),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  margin: EdgeInsets.only(top: 20.0),
                  color: MaterialColors.label,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                            onPressed: () {},
                            child: Text("Novidades".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        MaterialButton(
                            onPressed: () {},
                            child: Text("Ver".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))),
                      ],
                    ),
                  )),
            ),

// Importando imagens do firebase
            /*FutureBuilder<QuerySnapshot>(
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
            )*/
          ],
        ),
      ],
    );
  }
}
