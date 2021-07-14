import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/assets.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final String background = loginBack;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: MaterialColors.primary,
        title: Text("ENTRAR"),
        centerTitle: true,
        elevation: 5,
        actions: [],
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
                            image: NetworkImage(background), fit: BoxFit.fill)),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20.0),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                          ),
                          Text(
                            "Bem vindo(a) a Luíza Modas",
                            style:
                                TextStyle(color: Colors.white, fontSize: 28.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Faça seu Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "E-mail",
                              hintStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text.isEmpty || !text.contains("@")) {
                                return "E-mail inválido!";
                              }
                              return "null";
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: _passController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Senha",
                              hintStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty || text.length < 8) {
                                return "Senha inválida!";
                              }
                              return "null";
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                if (_emailController.text.isEmpty)
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Insira seu Email para recuperar sua senha!"),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                else {
                                  model.recoverPass(_emailController.text);
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Email para recuperação de senha enviado!"),
                                      backgroundColor: Colors.greenAccent,
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Esqueceu sua senha?",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: RaisedButton(
                                color: MaterialColors.label,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  "Entrar".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {}
                                  model.signIn(
                                      email: _emailController.text,
                                      pass: _passController.text,
                                      onSuccess: _onSuccess,
                                      onFail: _onFail);
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Não possui uma conta?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen()));
                                  },
                                  child: Text(
                                    "Crie sua conta",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao Entrar!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
