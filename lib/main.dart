import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
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
  //TODO - CEP teste - Em construção -
  //CepService().getAddressFromCep('68.025-360'); // Testar retorno do CEP
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Carrega o usuario logado na inicialização do app
    return ScopedModel<UserModel>(
      model: UserModel(),

      //Carrega o carrinho de compras do usuario logado na inicialização do app
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child: MaterialApp(
              title: 'Luíza Modas',
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: MaterialColors.primary,
                  secondaryHeaderColor: MaterialColors.label),
              debugShowCheckedModeBanner: false,
              //Direciona para a tela inicial do app
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
