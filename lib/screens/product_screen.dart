import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:loja/datas/cart_product.dart';
import 'package:loja/datas/product_data.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/models/cart_model.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/login_screen.dart';
import 'cart_screen.dart';

//Classe responsavel pela tela de produtos
class ProductScreen extends StatefulWidget {
  final ProductData product;
  ProductScreen(this.product);
  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  String size; //Caracteristica 1 do produto = Tamanho
  String type; //Caracteristica 2 do produto = Cor
  final ProductData product;
  _ProductScreenState(this.product);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Color primaryColor = MaterialColors.primary;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
        backgroundColor: MaterialColors.signStartGradient,
      ),
      body: ListView(
        children: <Widget>[
          //Slide imagens do produto
          AspectRatio(
            aspectRatio: 0.8,
            child: Carousel(
              boxFit: BoxFit.cover,
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              //Problemas de responsividade na animação das imagens
              //animationCurve: Curves.fastLinearToSlowEaseIn,
              //animationDuration: Duration(milliseconds: 2000),
              dotSize: 8.0,
              dotIncreasedColor: MaterialColors.label,
              dotSpacing: 16.0,
              dotBgColor: Colors.black26,
              dotColor: Colors.white,
              autoplay: true,
              autoplayDuration: Duration(seconds: 5),
            ),
          ),
          //Caracteristicas do produto
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                //Retorna o preço do produto
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: MaterialColors.label),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Retorna a descrição do produto
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Selecione o tamanho",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //Mostra as opções de tamanho para o usuario selecionar
                SizedBox(
                  height: 35.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.5),
                    children: product.size.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                  color: s == size
                                      ? MaterialColors.label
                                      : Colors.grey[500],
                                  width: 3.0)),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Selecione a cor",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                //Mostra as opções de cor
                SizedBox(
                  height: 50.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.5),
                    children: product.type.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            type = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(
                                  color: s == type
                                      ? MaterialColors.label
                                      : Colors.grey[500],
                                  width: 3.0)),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  height: 44.0,
                  child: ElevatedButton(
                    onPressed: size != null && type != null
                        ? () {
                            /*Função para adicionar os itens selecionado ao carrinho se
                            o usuario estiver logado*/
                            if (UserModel.of(context).isLoggedIn()) {
                              CartProduct cartProduct = CartProduct();
                              cartProduct.size = size;
                              cartProduct.type = type;
                              cartProduct.quantity = 1;
                              cartProduct.pid = product.id;
                              cartProduct.category = product.category;
                              cartProduct.productData = product;

                              //Adiciona os itens ao carrinho
                              CartModel.of(context).addCartItem(cartProduct);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(),
                                ),
                              );

                              /*Se o usuario não estiver logado ele irá para a tela login ao clicar em
                              'Faça login para comprar'*/
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                          }
                        : null,
                    //Verifica o estado
                    child: Text(
                      UserModel.of(context).isLoggedIn()
                          ? "ADICIONAR AO CARRINHO"
                          : "FAÇA LOGIN PARA COMPRAR",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: MaterialColors.label,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
