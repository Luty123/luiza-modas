import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/assets.dart';
import 'package:loja/helpers/validators.dart';
import 'package:loja/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:async/async.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _rePassController = TextEditingController();
  final _addressController = TextEditingController();
  final _districtAddressController = TextEditingController();
  final _complementAddressController = TextEditingController();
  final _contactController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String background = loginBack;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(background), fit: BoxFit.fill),
        ),
      ),
      GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(background),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      ListView(
                        padding: EdgeInsets.all(32.0),
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => _showSecondPage(context),
                            child: Hero(
                              tag: 'luiza-modas',
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        MaterialColors.signStartGradient,
                                        MaterialColors.socialDribbble,
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter),
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
                                        bottom: 10,
                                        right: 20,
                                        child: Text(
                                          'Bem Vindo(a)',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
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
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _nameController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _surnameController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
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
                            height: 32.0,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
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
                                else if (!emailValid(email))
                                  return 'E-mail inválido!';
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _passController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Senha: Deve ter no minimo 8 digitos",
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
                                else if (pass.length < 8)
                                  return 'Senha curta, deve conter no minimo 8 digítos';
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _rePassController,
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
                                  return 'Senha curta, deve conter no minimo 8 digítos';
                                else if (_rePassController.text !=
                                    _passController.text)
                                  return 'As senhas não correspondem';
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _addressController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Ex: Rua Azul, número 10",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira o nome da rua";
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _districtAddressController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Bairro",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira o nome do bairro";
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _complementAddressController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Complemento, Ex: Entre ruas 1 e 2",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira um ponto de referência";
                              },
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _contactController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Telefone: (99) 99999-9999",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.phone,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (text) {
                                if (text.isEmpty)
                                  return "Insira um número de telefone";
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
                                    Map<String, dynamic> userData = {
                                      "name": _nameController.text,
                                      "surname": _surnameController.text,
                                      "email": _emailController.text,
                                      "address": _addressController.text,
                                      "district":
                                          _districtAddressController.text,
                                      "complement":
                                          _complementAddressController.text,
                                      "contact": _contactController.text
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
                                  primary: MaterialColors.label,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso!"),
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 4),
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
        duration: Duration(seconds: 4),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Luíza Modas",
              style: TextStyle(color: MaterialColors.primary),
            ),
            centerTitle: true,
            backgroundColor: Colors.white30,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Center(
            child: Hero(
              tag: 'luiza-modas',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    MaterialColors.signStartGradient,
                    MaterialColors.socialDribbble,
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
                        bottom: 10,
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
            ),
          ),
        ),
      ),
    );
  }
}
