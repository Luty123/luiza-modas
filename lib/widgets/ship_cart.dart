import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/datas/address.dart';
import 'package:loja/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

//TODO - Opção de frete - Em construção -
//Widget responsavel pela opção de inserir e calcular o frete
class ShipCard extends StatefulWidget {
  @override
  State<ShipCard> createState() => _ShipCardState();
}

class _ShipCardState extends State<ShipCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cepController = TextEditingController();
  //String cep;

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
          ScopedModelDescendant<CartModel>(
            builder: (context, child, model) {
              final address = CartModel.of(context).getAddress ?? Address();
              print(address);
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: cepController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "12.345-678",
                        isDense: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CepInputFormatter(), // Formata o Cep para o padrão 12.345-678 utilizando o plugin brasil_fields
                      ],
                      keyboardType: TextInputType.number,
                      // Verificar a formatação do CEP
                      validator: (cep) {
                        if (cep.isEmpty) {
                          return 'Campo obrigatório';
                        } else if (cep.length != 10) {
                          return 'CEP inválido';
                        }
                        return null;
                      },
                      // onChanged: (text) => cep = text,
                    ),
                    //AddressInputField(address),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // context.read<CartModel>().getAddress(cepController.text);
                  //TODO - verificar parametro do getaddress
                  CartModel.of(context).getAddress(cepController.text);
                },
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
