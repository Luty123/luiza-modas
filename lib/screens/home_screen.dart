import 'package:flutter/material.dart';
import 'package:loja/tabs/home_tab.dart';
import 'package:loja/widgets/custom_drawer.dart';

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
        Container(color: Colors.red),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
      ],
    );
  }
}
