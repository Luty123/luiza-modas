import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loja/helpers/Theme.dart';

class ShipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Calcular frete",
          textAlign: TextAlign.start,
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
        ),
        leading: Icon(Icons.location_on),
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Digite seu CEP"),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Buscar CEP",
                  style: TextStyle(fontSize: 18.0),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  primary: Colors.white,
                  backgroundColor: MaterialColors.label,
                ),
              ),
            ],
          )
          /* Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      "Desculpe! Serviço indisponível no momento"), // Trocar por "Digite seu CEP quando a geolocalização for corrigida"
              initialValue: "",
              onFieldSubmitted: (text) {},
              
            ),
          
            
          ),*/
        ],
      ),
    );
  }
}
