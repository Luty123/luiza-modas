import 'package:cloud_firestore/cloud_firestore.dart';

class ProductHomeData {
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;
  List sizes;

  ProductHomeData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id; //id
    title = snapshot.data()["title"];
    description = snapshot.data()["description"];
    price = snapshot.data()["price"] + 0.0;
    images = snapshot.data()["images"];
    sizes = snapshot.data()["sizes"];
  }
  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
