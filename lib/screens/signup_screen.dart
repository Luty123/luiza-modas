import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/validators.dart';
import 'package:loja/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:async/async.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _name1Controller = TextEditingController();
  final _name2Controller = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();
  final _addressStreetController = TextEditingController();
  final _addressNumberController = TextEditingController();
  final _addressDistrictController = TextEditingController();
  final _adressComplementController = TextEditingController();
  //final _stateController = TextEditingController();
  final _contact1Controller = TextEditingController();
  final _contact2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialColors.drawerHeader,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: MaterialColors.primary,
        title: Text("CRIAR CONTA"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(32.0),
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      MaterialColors.drawerHeader,
                      MaterialColors.signStartGradient,
                    ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          bottom: 20,
                          right: 20,
                          child: Text(
                            'Bem Vindo(a)',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Center(
                        child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Flinkedin_banner_image_1.png?alt=media&token=4586b070-8b75-44c0-b915-4151fd45d84a",
                          height: 400,
                          width: 400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "Dados pessoais",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _name1Controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Primeiro nome",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.person,
                        color: MaterialColors.primary,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (name) {
                      /*if (text.isEmpty || text.contains(' ')) {
                        return "Nome inválido, insira apenas seu primeiro nome";
                      }*/
                      if (name.isEmpty)
                        return 'Campo obrigatório';
                      else if (name.trim().split(' ').length > 1 ||
                          name.contains(' '))
                        return 'Insira apenas o seu primeiro nome';
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _name2Controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Sobrenome",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.person_outline,
                        color: MaterialColors.primary,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (name2) {
                      if (name2.isEmpty)
                        return 'Campo obrigatório';
                      else if (name2.trim().split(' ').length < 1)
                        return 'Insira seu sobrenome completo';
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "E-mail",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.email,
                        color: MaterialColors.primary,
                      ),
                    ),
                    // ignore: missing_return
                    validator: (email) {
                      if (email.isEmpty)
                        return "Campo obrigatorio";
                      else if (!emailValid(email)) return 'E-mail inválido!';
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                      hintText: "A senha deve conter no minimo 8 digitos",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.vpn_key,
                        color: MaterialColors.primary,
                      ),
                    ),
                    obscureText: true,
                    // ignore: missing_return
                    validator: (pass) {
                      if (pass.isEmpty)
                        return "Campo obrigatorio";
                      else if (pass.length < 8) return 'Senha muito curta';
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _pass2Controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Repetir senha",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.vpn_key_outlined,
                        color: MaterialColors.primary,
                      ),
                    ),
                    obscureText: true,
                    // ignore: missing_return
                    validator: (pass2) {
                      if (pass2.isEmpty)
                        return "Campo obrigatorio";
                      else if (pass2.length < 8)
                        return 'As senhas não correspondem';
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "Endereço",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _addressStreetController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Rua",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.streetview,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Insira o nome da rua";
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _addressNumberController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Numero",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.house_siding,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Insira o número da casa";
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _addressDistrictController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Bairro",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.other_houses,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Insira o nome do bairro";
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _adressComplementController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Complemento",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.house_outlined,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Insira um ponto de referência";
                    },
                  ),
                ),
                /* Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _stateController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Cidade",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.person,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Endereço inválido!";
                    },
                  ),
                ),*/
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "Contato",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        height: 5,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _contact1Controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Telefone 1",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.phone,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Endereço inválido!";
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _contact2Controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Telefone 2",
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.phone,
                        color: MaterialColors.primary,
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "Endereço inválido!";
                    },
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (_pass2Controller != _passController)
                            return; // testar as senhas
                          Map<String, dynamic> userData = {
                            "name": _name1Controller.text,
                            "secondname": _name2Controller,
                            "email": _emailController.text,
                            "addresstret": _addressStreetController.text,
                            "addressnumber": _addressStreetController.text,
                            "addressdistrict": _addressDistrictController.text,
                            "addresscomplement":
                                _adressComplementController.text,
                            "contact1": _contact1Controller.text,
                            "contact2": _contact2Controller.text,
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
                        }
                      },
                      child: Text(
                        "CRIAR CONTA".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: MaterialColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      /* style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor),*/
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso!"),
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 3),
      ),
    );
    Future.delayed(Duration(seconds: 2))
        .then((_) => Navigator.of(context).pop());
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao criar usuário!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
