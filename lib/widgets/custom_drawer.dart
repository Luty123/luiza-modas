import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/oval-right-clipper.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/login_screen.dart';
import 'package:loja/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Widget responsavel pela personalização do menu
class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  final Color active = Colors.black;
  CustomDrawer(this.pageController);
  @override
  //Gradiente do background
  Widget build(BuildContext context) {
    // Widget _buildDrawerBack() => Container(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(colors: [
    //         Color.fromARGB(255, 253, 181, 168),
    //         Color.fromARGB(255, 255, 170, 255),
    //       ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    //     );
    //menu Drawer e lista de opções
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: MaterialColors.gradientStart),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => _showSecondPage(context),
                      child: Hero(
                        //Exibe o icone da loja, possui animação
                        tag: 'luiza-modas',
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Flogo.png?alt=media&token=63ec83ea-eefb-4706-9f78-216af289a870"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: MaterialColors.label),
                                child: Text("Loja Virtual Luíza Modas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star_border,
                                  color: MaterialColors.warning, size: 20)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0, top: 0.0),
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                //Exibe o primeiro nome do usuario logado
                                "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: MaterialColors.defaultButton),
                              ),
// Função  para detectar o entre ou cadastre-se
                              GestureDetector(
                                //Caso o usuario esteja deslogado, pede para entrar ou se cadastrar
                                //Caso o usuario estejaa logado, exibe o botão de logout
                                child: Text(
                                  !model.isLoggedIn()
                                      ? "Entre ou cadastre-se"
                                      : "Sair",
                                  style: TextStyle(
                                      color: MaterialColors.socialTwitter,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn())
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  else
                                    model.signOut();
                                },
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                //Lista das opções no menu e suas respectivas rotas
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                children: [
                  DrawerTile(
                    Icons.home,
                    "Inicio",
                    pageController,
                    0,
                  ),
                  DrawerTile(
                      Icons.shopping_cart, "Produtos", pageController, 1),
                  DrawerTile(Icons.maps_home_work, "Lojas", pageController, 2),
                  DrawerTile(
                      Icons.checklist, "Meus Pedidos", pageController, 3),
                  DrawerTile(Icons.person, "Sobre", pageController, 4),
                  DrawerTile(Icons.edit, "Termos", pageController, 5),
                  // DrawerTile(Icons.more_horiz, "Sobre", pageController, 6),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showSecondPage(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Luíza Modas",
            style: TextStyle(color: MaterialColors.primary),
          ),
          centerTitle: true,
          backgroundColor: Colors.white30,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Hero(
            tag: 'luiza-modas',
            child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Flogo.png?alt=media&token=63ec83ea-eefb-4706-9f78-216af289a870"),
          ),
        ),
      ),
    ),
  );
}
