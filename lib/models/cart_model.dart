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
    // Calcular frete ainda não concluido, nesse caso custo = envio fixo
    return 10.0;
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
