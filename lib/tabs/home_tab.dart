import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/loader.dart';
import 'package:loja/tabs/products_tab.dart';
import 'package:transparent_image/transparent_image.dart';

//Classe responsavel pelas função da Aba Inicial
class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            MaterialColors.signStartGradient,
            MaterialColors.signEndGradient,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    //Barra flutuante da tela inicial
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("users").get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Loader(),
          );
        } else {
          return Stack(
            children: [
              _buildBodyBack(),
              CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 250.0,
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
                  //Barra de seleção
                  SliverToBoxAdapter(
                    child: Container(
                      //margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      color: MaterialColors.success,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      //TODO Apontar para uma categoria especifica - Em construção -
                                      //Rota para a tela de categorias
                                      builder: (context) => ProductsTab(),
                                    ),
                                  );
                                },
                                child: Text("Promoções".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))),
                            MaterialButton(
                              onPressed: () {
                                //TODO Apontar para uma categoria especifica - Em construção -
                                //Rota para a tela de categorias
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductsTab(),
                                  ),
                                );
                              },
                              child: Text(
                                "Ver Todas".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //TODO Slide criar slide de imagens - Em construção -
                  //Grade de imagens
                  Container(
                    child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection("promotions")
                          .orderBy("position")
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return SliverToBoxAdapter(
                            child: Container(
                                height: 100.0,
                                alignment: Alignment.center,
                                child: Loader()),
                          );
                        else
                          return Container(
                            /*Obtem as imagens do banco de dados e ordena elas em 
                            grade de acordo com a posição definida*/
                            child: SliverStaggeredGrid.count(
                              crossAxisCount: 4,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
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
                    ),
                  ),
                  //Barra de seleção
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      color: MaterialColors.success,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            MaterialButton(
                                onPressed: () {
                                  //TODO Apontar para uma categoria especifica - Em construção -
                                  //Rota para a tela de categorias
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProductsTab(),
                                    ),
                                  );
                                },
                                child: Text("Novidades".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))),
                            MaterialButton(
                              onPressed: () {
                                //TODO Apontar para uma categoria especifica - Em construção -
                                //Rota para a tela de categorias
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductsTab(),
                                  ),
                                );
                              },
                              child: Text(
                                "Ver Todas".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //TODO Slide criar slide de imagens - Em construção -
                    //Grade de imagens
                    child: FutureBuilder<QuerySnapshot>(
                      future: FirebaseFirestore.instance
                          .collection("news")
                          .orderBy("position")
                          .get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return SliverToBoxAdapter(
                            child: Container(
                                height: 250.0,
                                alignment: Alignment.center,
                                child: Loader()),
                          );
                        else
                          return Container(
                            /*Obtem as imagens do banco de dados e ordena elas em 
                            grade de acordo com a posição definida*/
                            child: SliverStaggeredGrid.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
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
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
