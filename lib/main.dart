import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
// Inicializar o firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nayra Fashion Village',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
