import 'package:flutter/material.dart';
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
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(background), fit: BoxFit.cover)),
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
                      height: 100.0,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 28.0),
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text("Sigi In".toUpperCase()),
                        onPressed: () {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont have an account?",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "SIGN UP",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
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
      /* key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 211, 118, 130),
        title: Text("ENTRAR"),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              "CRIAR CONTA",
              style: TextStyle(fontSize: 15.0),
            ),
            style: TextButton.styleFrom(primary: Colors.white),
          ),
        ],
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
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
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
                  controller: _passController,
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return "Senha inválida!";
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // background
                      onPrimary:
                          Color.fromARGB(255, 211, 118, 130), // foreground
                    ),
                    onPressed: () {
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
                      "Esqueci minha senha",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.zero),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                      model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail);
                    },
                    child: Text(
                      "ENTRAR",
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
          );
        },
      ),*/
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
