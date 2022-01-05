import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/datas/cart_product.dart';
import 'package:loja/datas/product_data.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/loader.dart';
import 'package:loja/models/cart_model.dart';
import 'package:loja/widgets/oval_top_border_clipper.dart';

//Classe responsavel pelos elementos que serão exibidos na tela do carrinho
class CartTile extends StatelessWidget {
  final CartProduct cartProduct;
  CartTile(this.cartProduct);
  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      //Atualiza os preços do resumo do carrinho
      CartModel.of(context).updatePrice();
      return Card(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(width: 10.0),
            Container(
              //Exibe a imagem do produto
              height: 150.0,
              padding: EdgeInsets.all(8.0),
              width: 120.0,
              child: Image.network(
                cartProduct.productData.images[0],
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: ClipPath(
                clipper: OvalTopBorderClipper(),
                child: Container(
                  height: 180,
                  // padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey.shade700,
                          spreadRadius: 80.0),
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        cartProduct.productData.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                      Text(
                        //Exibe o tamanho do produto
                        "Tamanho: ${cartProduct.size}",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        //Exibe o tipo do produto
                        "Tipo: ${cartProduct.type}",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        //Exibe o preço do produto
                        "R\$ ${cartProduct.productData.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      //Controla a quantidade de itens do produto, incrementando ou decrementando
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.remove),
                              color: Theme.of(context).primaryColor,
                              onPressed: cartProduct.quantity > 1
                                  ? () {
                                      CartModel.of(context)
                                          .decProduct(cartProduct);
                                    }
                                  : null),
                          Text(cartProduct.quantity.toString()),
                          IconButton(
                              icon: Icon(Icons.add),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                CartModel.of(context).incProduct(cartProduct);
                              }),
                          ElevatedButton(
                            onPressed: () {
                              CartModel.of(context).removeCartItem(cartProduct);
                            },
                            child:
                                Text("Remover"), //Remove o produto do carrinho
                            style: ElevatedButton.styleFrom(
                              primary: MaterialColors.label,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
      child: cartProduct.productData == null
          ? FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection("products")
                  .doc(cartProduct.category)
                  .collection("itens")
                  .doc(cartProduct.pid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  cartProduct.productData =
                      ProductData.fromDocument(snapshot.data);
                  return _buildContent();
                } else {
                  return Container(
                    height: 70.0,
                    child: Loader(),
                    alignment: Alignment.center,
                  );
                }
              },
            )
          : _buildContent(),
    );
  }
}
