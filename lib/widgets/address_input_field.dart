import 'package:flutter/material.dart';
import 'package:loja/datas/address.dart';

class AddressInputField extends StatelessWidget {
  // const AddressInputField({ Key? key }) : super(key: key);

  final Address address;

  const AddressInputField(this.address);

  @override
  Widget build(BuildContext context) {
    // Validador dos campos
    String emptyValidator(String text) =>
        text.isEmpty ? 'Campo obrigatório' : null;

    return Column(
      children: <Widget>[
        TextFormField(
          initialValue: address.street,
          decoration: const InputDecoration(
            isDense: true,
            labelText: "Rua/Avenida",
            hintText: "Avenida Presidente Vargas",
          ),
          validator: emptyValidator,
        ),
      ],
    );
  }
}
