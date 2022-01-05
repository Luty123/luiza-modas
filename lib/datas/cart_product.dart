import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja/datas/product_data.dart';

// Carrinho de compras
// Classe para armazenar e tratar os dados dos produtos no carrinho de compras
class CartProduct {
  String cid; // ID do carrinho onde serão armazenados os produtos
  String category; // ID categoria do produto
  String pid; // ID do produto
  int quantity; // Quantidade de produtos no carrinho
  String size; // Tamanho do produto
  String type;

  ProductData productData; //Import, dados do produto que estão em productdata
  CartProduct();

// Constructor para obter os dados dos produtos do firebase e adicionar no carrinho

  CartProduct.fromDocument(DocumentSnapshot document) {
    cid = document.id;
    category = document.data()["category"];
    pid = document.data()["pid"];
    quantity = document.data()["quantity"];
    size = document.data()["size"];
    type = document.data()["type"];
  }

  //Map para obter os dados do carrinho e enviar para o firebase
  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
      "type": type,
      "product": productData
          .toResumedMap() // Função para armazenar apenas um resumo do produto (product_data.dart)
    };
  }
}
