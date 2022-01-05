import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';

//Classe responsavel pelos elementos que serão exibidos no menu lateral
class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(
    this.icon,
    this.text,
    this.controller,
    this.page,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      //Função para linkar as outras paginas com as opções referente no menu
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        //Lista do menu - opções
        child: Container(
          height: 45.0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          margin: EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: controller.page.round() == page
                ? MaterialColors.active
                : Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  icon,
                  size: 25.0,
                  color: controller.page.round() == page
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: controller.page.round() == page
                      ? Colors.white
                      : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
