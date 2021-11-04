import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/tabs/home_tab.dart';
import 'package:loja/tabs/orders_tab.dart';
import 'package:loja/tabs/places_tab.dart';
import 'package:loja/widgets/cart_button.dart';
import 'package:loja/widgets/custom_drawer.dart';
import 'package:loja/tabs/products_tab.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({Key key}) : super(key: key);
  final _pageController =
      PageController(); //Controlador de pagina para não deslizar lateralmente

  @override
  Widget build(BuildContext context) {
    //Chamar _pageCrontoller.jumpToPage, para decidir em qual pagina iniciar
    return PageView(
      controller: _pageController,
      physics:
          NeverScrollableScrollPhysics(), //Chamada para não delizar as paginas
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            centerTitle: true,
            backgroundColor: MaterialColors.signStartGradient,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Lojas"),
            centerTitle: true,
            backgroundColor: MaterialColors.signStartGradient,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
          backgroundColor: MaterialColors.active,
        ),
        Scaffold(
            appBar: AppBar(
              title: Text("Meus pedidos"),
              centerTitle: true,
              backgroundColor: MaterialColors.signStartGradient,
            ),
            body: OrdersTab(),
            drawer: CustomDrawer(_pageController),
            backgroundColor: Colors.white)
      ],
    );
  }
}
