import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja/datas/cart_product.dart';
import 'package:loja/datas/address.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/services/cep_service.dart';
import 'package:scoped_model/scoped_model.dart';

// Classe responsavel pelas funções do carrinho de compras nos dois estados (logado ou deslogado)

//  final valueDelivery = new valueDelivery(
//   FirebaseFirestore.instance
//       .collection("delivery")
//       .doc("pricedelivery")
//       .get()
//       .then((docSnap) {
//     if (docSnap.data() != null) {
//       return docSnap.data()["value"];
//     }
//   })
// );

class CartModel extends Model {
  UserModel user;
  Address address;

  List<CartProduct> products = [];
  String couponCode;
  int discountPercentage = 0;
  bool isLoading = false;
  bool switchVal = false;

  //Função para retornar o carrinho salvo do usuario logado
  CartModel(this.user) {
    if (user.isLoggedIn()) _loadCartItens();
  }
  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);

    FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .add(cartProduct.toMap())
        .then(
      (doc) {
        cartProduct.cid = doc.id;
      },
    );
    notifyListeners();
  }

  //Função remover os itens do carrinho
  void removeCartItem(CartProduct cartProduct) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .doc(cartProduct.cid)
        .delete();

    products.remove(cartProduct);
    notifyListeners();
  }

  //Função decrementar a quantidade de itens do carrinho
  void decProduct(CartProduct cartProduct) {
    cartProduct.quantity--;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .doc(cartProduct.cid)
        .update(cartProduct.toMap());
    notifyListeners();
  }

  //Função para incrementar a quantidade de itens no carrinho
  void incProduct(CartProduct cartProduct) {
    cartProduct.quantity++;
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .doc(cartProduct.cid)
        .update(cartProduct.toMap());
    notifyListeners();
  }

  //Função para aplicar cupon de desconto
  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;

    notifyListeners();
  }

  //Função para atualizar os preços no momento da compilação / Widget _buildContent() em cart_tile
  void updatePrice() {
    notifyListeners();
  }

  //Função para retornar o subtotal do pedido
  double getProductsPrice() {
    double price = 0.0;
    for (CartProduct c in products) {
      if (c.productData != null)
        price +=
            c.quantity * c.productData.price; //Quantidade do produto * preço
    }
    return price;
  }

  //Função para retornar o desconto
  double getDiscount() {
    return getProductsPrice() *
        discountPercentage /
        100; //Quantidade do desconto/100 * preço do produto
  }

  //TODO - CEP Calculo - Em construção -
  //Função para retornar o valor da entrega
  double getShipPrice(switchVal) {
    if (switchVal == true) {
      return 10.0;
    } else
      return 0.0;
  }

  //Função para finalizar o pedido passando as informações que devem ser salvas
  Future<String> finishOrder() async {
    if (products.length == 0) return null;
    isLoading = true;
    notifyListeners();
    double productsPrice = getProductsPrice();
    double shipPrice = getShipPrice(switchVal);
    double discount = getDiscount();

    //Transformar e recuperar o id do pedido. Salvar em Order (firebase) e obter a referencia (refOrder)
    DocumentReference refOrder =
        await FirebaseFirestore.instance.collection("orders").add(
      {
        "clientId": user.firebaseUser.uid,
        "products": products.map((cartProduct) => cartProduct.toMap()).toList(),
        "shipPrice": shipPrice,
        "productsPrice": productsPrice,
        "discount": discount,
        "totalPrice": productsPrice - discount + shipPrice,
        "status": 1
      },
    );
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser.uid)
        .collection("orders")
        .doc(refOrder.id)
        .set(
      {"orderId": refOrder.id},
    );

    //Obter todos os produtos do carrinho do usuario e deletar
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection("user")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .get();

    for (DocumentSnapshot doc in query.docs) {
      doc.reference.delete();
    }
    products.clear(); //Limpa a lista local de produtos
    couponCode = null; //Limpa o desconto aplicado
    discountPercentage = 0;

    isLoading = false;
    notifyListeners();
    return refOrder.id;
  }

  void _loadCartItens() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .get();
    products = query.docs.map((doc) => CartProduct.fromDocument(doc)).toList();
    notifyListeners();
  }

  //TODO - CEP obter dados da API - Em construção -
  //Obter endereço de cep da API
  Future<void> getAddress(String cep) async {
    final cepService = CepService();
    notifyListeners();
    try {
      //Se a API for alterada, basta trocar o final cepAddress e fazer apontar para o novo serviço de API
      final cepAddress = await cepService.getAddressFromCep(cep);
      if (cepAddress != null) {
        address = Address(
          street: cepAddress.logradouro,
          district: cepAddress.bairro,
          zipCode: cepAddress.cep,
          city: cepAddress.cidade.nome,
          state: cepAddress.estado.sigla,
          latitude: cepAddress.latitude,
          longitude: cepAddress.longitude,
        );
        notifyListeners();
      }

      //print(cepAddress);
    } catch (e) {
      //debugPrint(e.toString());
      notifyListeners();
    }
  }
}
