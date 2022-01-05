import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/loader.dart';
import 'package:loja/tiles/category_tile.dart';

//Classe responsavel por exibir os produtos na tela
class ProductsTab extends StatefulWidget {
  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  //final _pageController = PageController();

  bool _showBackToTopButton = false;

  ScrollController _scrollController;

  @override
  //Metodo para configurar o botão de voltar ao topo da pagina
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = false; // mostrar botão voltar ao topo
          } else {
            _showBackToTopButton = true; // esconder botão voltar ao topo
          }
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController
        .dispose(); // dispose do controller do botão voltar ao topo
  }

  //Função acionada quando o usuário pressionar o botão para voltar ao topo
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 800), curve: Curves.fastOutSlowIn);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text("Categorias"),
            centerTitle: true,
            backgroundColor: MaterialColors.active,
          ),
        ],
        body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection("products")
              .orderBy("title")
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Loader(),
              );
            else {
              //Exibe a imagens
              var dividedTiles = ListTile.divideTiles(
                      tiles: snapshot.data.docs.map((doc) {
                        return CategoryTile(doc);
                      }).toList(),
                      color: Colors.pink[500])
                  .toList();

              return ListView(
                children: dividedTiles,
              );
            }
          },
        ),
      ),
      //Define as propriedades e posição do botão voltar ao topo
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(
                Icons.arrow_upward,
              ),
              backgroundColor: MaterialColors.active,
            ),
    );
  }
}
