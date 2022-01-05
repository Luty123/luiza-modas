import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/tabs/about_tab.dart';
import 'package:loja/tabs/home_tab.dart';
import 'package:loja/tabs/orders_tab.dart';
import 'package:loja/tabs/places_tab.dart';
import 'package:loja/tabs/terms_tab.dart';
import 'package:loja/widgets/cart_button.dart';
import 'package:loja/widgets/custom_drawer.dart';
import 'package:loja/tabs/products_tab.dart';

//Classe responsavel pela tela inicial do app
class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key key}) : super(key: key);
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //Chamar _pageCrontoller.jumpToPage, para decidir em qual pagina iniciar
    return PageView(
      controller: _pageController,
      physics:
          NeverScrollableScrollPhysics(), //Metodo para a pagina não delizar lateralmente
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(), //Botão do carrinho de compras
        ),
        //Aba de produtos
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
            backgroundColor: MaterialColors.signStartGradient,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          // TODO erro ao usar dois floatingactionbuttons na mesma tela - Verificar como corrigir
          //floatingActionButton: CartButton(),
        ),
        //Aba da localização e contato da loja
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
            backgroundColor: MaterialColors.signStartGradient,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
          backgroundColor: MaterialColors.defaultButton,
        ),
        //Aba para verificar o status dos pedidos do usuario
        Scaffold(
            appBar: AppBar(
              title: Text("Meus pedidos"),
              centerTitle: true,
              backgroundColor: MaterialColors.signStartGradient,
            ),
            body: OrdersTab(),
            drawer: CustomDrawer(_pageController),
            backgroundColor: Colors.white),
        //Aba Sobre o app e o desenvolvedor
        Scaffold(
            appBar: AppBar(
              title: Text("Sobre"),
              centerTitle: true,
              backgroundColor: MaterialColors.signStartGradient,
            ),
            body: AboutTab(),
            drawer: CustomDrawer(_pageController),
            backgroundColor: Colors.white),
        Scaffold(
            appBar: AppBar(
              title: Text("Termos"),
              centerTitle: true,
              backgroundColor: MaterialColors.signStartGradient,
            ),
            body: TermsTtab(),
            drawer: CustomDrawer(_pageController),
            backgroundColor: Colors.white),
      ],
    );
  }
}
