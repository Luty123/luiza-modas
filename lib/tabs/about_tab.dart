import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loja/helpers/Theme.dart';

//Classe responsavel pela guia Sobre
class AboutTab extends StatefulWidget {
  //const AboutTab({ Key? key }) : super(key: key);

  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialColors.socialDribbble,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text('Entre em contato comigo'),
            centerTitle: true,
            backgroundColor: MaterialColors.signEndGradient,
            actions: <Widget>[
              IconButton(
                  // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                  icon: FaIcon(FontAwesomeIcons.whatsapp,
                      color: Colors.greenAccent),
                  onPressed: () {
                    //TODO adicionar whatsapp
                    print("Pressed");
                  }),
            ],
          ),
        ],
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/assets%2Fnotebook-css-1200x729.jpg?alt=media&token=a145f951-8074-4975-a14c-7e2c2c1068dd')),
                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Loja Virtual",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10.0),
                      Text("Dez 28, 2021"),
                      Divider(),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Flogo.png?alt=media&token=63ec83ea-eefb-4706-9f78-216af289a870"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Olá! Eu me chamo Luciano Paiva Eufrázio, sou o criador deste aplicativo de loja virtual. A loja virtual é um aplicativo simples, e com ótimo custo benefício para seu empreendimento. Funciona como uma vitrine virtual, onde você pode expor seus produtos para que seus clientes possam comprar. A Loja virtual está em constante atualização, adiciono novos detalhes frequentemente para tornar mais prático e agradável o uso do aplicativo. Essa versão que você está utilizando da loja virtual agora, é a versão v1.0. Grandes novidades estão por vir nas próximas atualizações.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Me tornarei Bacharel em Sistemas de Informação, com previsão de formação em 2022 pela Universidade Federal do Oeste do Pará - UFOPA. Desenvolvo sistemas para solucionar problemas tecnologicos. A loja virtual é o primeiro projeto que disponibilizo publicamente. Caso tenha interesse em saber mais sobre mim e meu trabalho, entre em contato comigo por meu e-mail: lucianopaiva.e@gmail.com, ou clique no ícone do WhatsApp no topo da tela para me mandar diretamente uma mensagem. Dito isto, faça bom uso da loja",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
