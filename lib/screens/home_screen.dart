import 'package:flutter/material.dart';
import 'package:loja/tabs/home_tab.dart';
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
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 211, 118, 130),
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}
