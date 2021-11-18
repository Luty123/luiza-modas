import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/models/cart_model.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loja/services/cep_service.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

//Lottie.asset('assets/68367-newspaper-loading.json');
void main() async {
// Inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
// CepService().getAdressFromCep('68.025-360'); // Testar retorno do CEP
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
              title: 'Luíza Modas',
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: MaterialColors.primary,
                  secondaryHeaderColor: MaterialColors.label),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
