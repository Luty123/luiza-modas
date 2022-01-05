import 'package:cloud_firestore/cloud_firestore.dart';

// Classe para armazenar e tratar os dados dos produtos no carrinho de compras
class ProductData {
  String category; // Categoris do produto
  String id; // Id do produto
  String title; // Titulo do produto
  String description; // Descrição do produto
  double price; // Preço do produto
  List images; // Imagens do produto
  List size; // Caracteristica 1 - Nesse caso é o tamanho do produto
  List type; // Caracteristica 2 - Nesse caso é a cor do produto

  //Constructor para obter os dados dos produtos do firebase
  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id; //id
    title = snapshot.data()["title"];
    description = snapshot.data()["description"];
    price = snapshot.data()["price"] + 0.0;
    images = snapshot.data()["images"];
    size = snapshot.data()["size"];
    type = snapshot.data()["type"];
  }
  //Metodo para retornar o resumo do produto
  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
