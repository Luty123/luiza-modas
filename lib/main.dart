import 'package:flutter/material.dart';
import 'package:loja/models/cart_model.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
// Inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// Scoped do usuario
    return ScopedModel<UserModel>(
      model: UserModel(),
// Scoped do carrinho
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              title: 'Nayra\'s Fashion Village',
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Color.fromARGB(255, 4, 125, 141),
                  secondaryHeaderColor: Color.fromARGB(255, 211, 118, 130)),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
