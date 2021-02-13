import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  DrawerTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
// Função para linkar as outras paginas
      child: InkWell(
        onTap: () {},
// Lista do menu - opções
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 35.0,
                color: Colors.black,
              ),
              SizedBox(
                width: 30.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
