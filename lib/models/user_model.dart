import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';

// Classe para importar e tratar os dados de cadastro, login e logout do usuario
// Gerencia de estados utilizada com ScopedModel
class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User firebaseUser;

  Map<String, dynamic> userData =
      Map(); //Mapa contendo as informações do usuario

  bool isLoading = false;
  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listner) {
    super.addListener(listner);
    _loadCurrentUser();
  }

  //Recebe os dados cadastrados do usuario cadastrados
  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();
    //Tenta criar o usuario com os dados informados
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((credentials) async {
      //Se o cadastro for um sucesso
      firebaseUser = credentials.user;
      await _saveUserData(
          userData); //Salva as outras informações alem do email e senha

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      //Caso ocorra algum erro no cadastro
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((credentials) async {
      firebaseUser = credentials.user;

      await _loadCurrentUser();
      await Future.delayed(Duration(seconds: 3));

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      //print('${e.code}');
      onFail();
      isLoading = false;
      notifyListeners();
    })
      ..whenComplete(() {
        onFail();
        isLoading = false;
        notifyListeners();
      });
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  void signOut() async {
    await _auth.signOut();
    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  //Função para salvar os dados do usuario no firebase
  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .set(userData);
  }

  //Função para carregar os dados do usuario no firebase
  Future<Null> _loadCurrentUser() async {
    // ignore: await_only_futures
    if (firebaseUser == null) firebaseUser = await _auth.currentUser;
    if (firebaseUser != null) {
      if (userData["name"] == null) {
        DocumentSnapshot docUser = await FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .get();
        userData = docUser.data();
      }
    }
    notifyListeners();
  }
}

//class FirebaseUser {}
