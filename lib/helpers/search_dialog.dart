// Quando for implementar o botão  de  pesquisar
import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';

class SearchDialog extends StatelessWidget {
  //const SearchDialog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2.0,
          left: 4.0,
          right: 4.0,
          child: Card(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  color: MaterialColors.primary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              onFieldSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
