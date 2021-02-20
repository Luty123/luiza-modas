import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        title: Text("CRIAR CONTA"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: "Nome completo"),
              validator: (text) {
                if (text.isEmpty) return "Nome inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains("@"))
                  return "E-mail inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6)
                  return "Senha inválida! A senha deve conter 6 digitos";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Endereço"),
              validator: (text) {
                if (text.isEmpty) return "Endereço inválido!";
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
                child: Text(
                  "CRIAR CONTA",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
