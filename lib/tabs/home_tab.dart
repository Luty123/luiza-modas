import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("users").get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Stack(
            children: [
              _buildBodyBack(),
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 200.0,
                    // floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          "Destaques",
                          style: TextStyle(fontSize: 16),
                        ),
                        centerTitle: true,
                        background: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Ffacebook_cover_photo_2.png?alt=media&token=e32c5724-4e6f-4318-a105-90b905c03f91",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        color: MaterialColors.socialDribbble,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              MaterialButton(
                                  onPressed: () {},
                                  child: Text("Promoções".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold))),
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Ver Todas".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("promotions")
                        .orderBy("position")
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return SliverToBoxAdapter(
                          child: Container(
                            height: 200.0,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        );
                      else
                        return Container(
                          child: SliverStaggeredGrid.count(
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
                          ),
                        );
                    },
                  )
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
