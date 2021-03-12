import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja/datas/cart_product.dart';
import 'package:loja/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  UserModel user;

  List<CartProduct> products = [];
  String couponCode;
  int discountPercentage = 0;
  bool isLoading = false;

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

  void setCoupon(String couponCode, int discountPercentage) {
    this.couponCode = couponCode;
    this.discountPercentage = discountPercentage;

    notifyListeners();
  }

// Função para atualizar os preços no momento da compilação / Widget _buildContent() em cart_tile
  void updatePrice() {
    notifyListeners();
  }

// Função para retornar o subtotal
  double getProductsPrice() {
    double price = 0.0;
    for (CartProduct c in products) {
      if (c.productData != null)
        price +=
            c.quantity * c.productData.price; // Quantidade do produto * preço
    }
    return price;
  }

// Função para retornar o desconto
  double getDiscount() {
    return getProductsPrice() *
        discountPercentage /
        100; // Quantidade do desconto/100 * preço do produto
  }

// Função para retornar o valor da entrega
  double getShipPrice() {
    return 10.0;
  }

// Função para finalizar o pedido passando as informações que devem ser salvas
  Future<String> finishOrder() async {
    if (products.length == 0) return null;
    isLoading = true;
    notifyListeners();
    double productsPrice = getProductsPrice();
    double shipPrice = getShipPrice();
    double discount = getDiscount();

    // Transformar e recuperar o id do pedido. Salvar em Order (firebase) e obter a referencia (refOrder)

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

// Obter todos os produtos do carrinho do usuario e deletar
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection("user")
        .doc(user.firebaseUser.uid)
        .collection("cart")
        .get();

    for (DocumentSnapshot doc in query.docs) {
      doc.reference.delete();
    }
// Limpar a lista local de produtos
    products.clear();
// Limpar o desconto aplicado
    couponCode = null;
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
}
