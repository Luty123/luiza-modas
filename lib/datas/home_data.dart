import 'package:cloud_firestore/cloud_firestore.dart';

class HomeData {
  List images;

  HomeData.fromDocument(DocumentSnapshot snapshot) {
    images = snapshot.data()["images"];
  }
}
