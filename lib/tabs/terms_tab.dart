import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/screens/declarations/politics_screen.dart';
import 'package:loja/screens/declarations/terms_screen.dart';

class TermsTtab extends StatelessWidget {
  //const TermsTtab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        MaterialColors.signStartGradient,
        MaterialColors.signEndGradient,
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: SizedBox.expand(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TermsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "TERMOS",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            backgroundColor: MaterialColors.active)),
                  ),
                ],
              ),
              //Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PoliticsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "POLÍTICAS",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white,
                            backgroundColor: MaterialColors.active)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
