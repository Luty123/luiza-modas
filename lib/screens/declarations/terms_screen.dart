import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';

class TermsScreen extends StatelessWidget {
  //const TermsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termos e condições de uso'),
        backgroundColor: MaterialColors.signStartGradient,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Ffacebook_profile_image.png?alt=media&token=0e97a00b-f16b-4b1b-90ae-31a4f9740d2a',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.slideshow,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Loja Virtual Luíza Modas",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Jan 01, 2022",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.share),
                      //   onPressed: () {},
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Seja bem-vindo(a) ao nosso aplicativo. Leia com atenção todos os termos abaixo.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.favorite_border),
                  //     SizedBox(
                  //       width: 5.0,
                  //     ),
                  //     Text("20.2k"),
                  //     SizedBox(
                  //       width: 16.0,
                  //     ),
                  //     Icon(Icons.comment),
                  //     SizedBox(
                  //       width: 5.0,
                  //     ),
                  //     Text("2.2k"),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Este documento, e todo o conteúdo do aplicativo é oferecido pela loja Luíza Modas, neste termo representado apenas por EMPRESA, que regulamenta detém direitos e obrigações com todos que acessam o aplicativo, denominado neste termo como USUÁRIO, além disso, há o elemento DESENVOLVEDOR, citado na aba SOBRE do aplicativo, reguardado todos os direitos previstos na legislação, trazem as cláusulas abaixo como requisito para acesso a plataforma.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Todo o conteúdo é atualizado periodicamente, porém, pode conter em algum artigo, vídeo ou imagem, alguma informação que não reflita a verdade atual, não podendo a EMPRESA ser responsabilizada de nenhuma forma ou meio por qualquer conteúdo que não esteja devidamente atualizado.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '\n1. DA FUNÇÃO DO APLICATIVO\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Este aplicativo foi criado e desenvolvido com a função de trazer praticidade e comodidade ao adquirir produtos da loja Luíza Modas. A EMPRESA busca através da divulgação de seus produtos, trazer o conhecimento ao alcance de todos, assim como comodidade para seus clientes realizarem pedidos.'
                              'Nesta plataforma, poderá ser realizado tanto a divulgação de promoções e eventos, assim como a divulgação de produtos de e-commerce. Todo o conteúdo presente neste aplicativo foi desenvolvido buscando fontes e materiais de confiabilidade para obter qualidade no produto final.'
                              'Todo o conteúdo é, e será atualizado periodicamente de acordo com a demanda que for identificada pelo DESENVOLVEDOR, porém pode conter algum elemento, alguma informação que não reflita com os valores do DESENVOLVEDOR, não podendo a DESENVOLVEDOR ser responsabilizado de nenhuma forma ou meio por qualquer conteúdo que não esteja devidamente sobre suas responsabilidades, o conteudo dos produtos e informações exibidos é de inteira responsabilidade da EMPRESA, caso alguma informação cadastrada viole alguma lei, regra ou gere insatisfação como produtos com imagens improprias, palavras ofensivas, informações falsas, ou qualquer elemento que vá contra os direitors constitucionais, de etica ou moral, a EMPRESA deve prestar esclarecimento'
                              'É de responsabilidade do usuário ao usar suas informações presentes no aplicaivo com senso crítico, utilizando apenas como fonte de informação, e sempre buscando especialistas da área para a solução concreta do seu conflito.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n2. DO ACEITE DOS TERMOS\n',
                        ),
                        TextSpan(
                          text:
                              'Este documento, chamado “Termos de Uso”, aplicáveis a todos os usuários do aplicativo, e desenvolvido pelo Advogado Diego Castro (OAB/PI 15.613), o documento foi disponibilizado em seu site e pode ser verificado através do link: https://diegocastro.adv.br/modelo-de-termos-de-uso-para-blogs-e-sites/, o documento disponibilizado gratuitamente e com consentimento do autor, foi modificado para esse aplicativo.'
                              'Este termo especifica e exige que todo usuário ao acessar o aplicativo da EMPRESA, leia e compreenda todas as cláusulas do mesmo, visto que ele estabelece entre a EMPRESA e o USUÁRIO direitos e obrigações entre ambas as partes, aceitos expressamente pelo USUÁRIO a permanecer utilizando o aplicativo da EMPRESA.'
                              'Ao continuar utilizando o aplicativo, o USUÁRIO expressa que aceita e entende todas as cláusulas, assim como concorda integralmente com cada uma delas, sendo este aceite imprescindível para a permanência na mesma. Caso o USUÁRIO discorde de alguma cláusula ou termo deste contrato, o mesmo deve imediatamente interromper seu cadastro de todas as formas e meios.'
                              'Este termo pode e irá ser atualizado periodicamente pela EMPRESA se a mesma assim desejar, que se resguarda no direito de alteração, desde que oficialente realize aviso prévio e comunique o DESENVOLVEDOR para ele realizar a devida atualização no aplicativo. É importante que o USUÁRIO confira sempre se houve alterações e qual foi a última atualização do mesmo na aba TERMOS.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n3. DO GLOSSÁRIO\n',
                        ),
                        TextSpan(
                          text:
                              'Este termo pode conter algumas palavras específicas que podem não se de conhecimento geral. Entre elas:',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Usuário: ',
                        ),
                        TextSpan(
                          text:
                              'Todo e qualquer usuário do site, de qualquer forma e meio, que acesse através de qualquer dispositivo, ou quaisquer outros meios, este aplicativo da EMPRESA.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Navegação: ',
                        ),
                        TextSpan(
                          text:
                              'O ato de visualizar e transitar nas telas e visualizar o conteúdo do aplicativo da EMPRESA.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Login: ',
                        ),
                        TextSpan(
                          text:
                              'Dados de acesso do USUÁRIO ao realizar o cadastro junto a EMPRESA, dados esses que dão acesso a funções restritas do aplicativo.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     E-commerce: ',
                        ),
                        TextSpan(
                          text:
                              'Refere-se às transações comerciais realizadas no aplicativo atravé da internet.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n4. DO ACESSO AO APLICATIVO\n',
                        ),
                        TextSpan(
                          text:
                              'O  Aplicativo da Lojo Virtual funciona normalmente 24 (vinte e quatro) horas por dia, porém podem ocorrer pequenas interrupções de forma temporária para ajustes, manutenção, mudança de servidores, falhas técnicas ou por ordem de força maior, que podem deixar o aplicativo indisponível por tempo indeterminado ate que as devidas providências sejam tomadas e o mesmo possa reestabelecer sua atividade.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n4. DO ACESSO AO APLICATIVO\n',
                        ),
                        TextSpan(
                          text:
                              'O  Aplicativo da Lojo Virtual funciona normalmente 24 (vinte e quatro) horas por dia, porém podem ocorrer pequenas interrupções de forma temporária para ajustes, manutenção, mudança de servidores, falhas técnicas ou por ordem de força maior, que podem deixar o aplicativo indisponível por tempo indeterminado ate que as devidas providências sejam tomadas e o mesmo possa reestabelecer sua atividade.'
                              'A EMPRESA e o DESENVOLVEDOR não se responsabilizam por nenhuma perda de oportunidade ou prejuízos que esta indisponibilidade temporária possa gerar aos usuários se o motivo não foi proposital.'
                              'Em caso de manutenções que exigirem um determinado tempo, a EMPRESA irá informar previamente aos clientes da necessidade e do tempo previsto em que o aplicativo ficará offline.'
                              'O acesso ao aplicativo só é permitido a maiores de 18 anos de idade ou que possuírem capacidade civil plena. Para acesso de menores de idade, é necessária a expressa autorização dos pais ou tutores, ficando o mesmo responsáveis sobre qualquer compra ou acesso efetuados pelo mesmo. A EMPRESA e o DESENVOLVEDOR não se responsabilizam por acesso de menores de 18 anos ou quaisquer atividades que realizem durante o uso do aplicativo '
                              'Caso seja necessário realizar um cadastro junto ao aplicativo, o USUÁRIO deverá preencher um formulário com seus dados e informações solicitadas, para ter acesso as funcionalidades restritas, como: realizar alguma compra.'
                              'Todos os dados estão protegidos conforme a Lei Geral de Proteção de Dados, e ao realizar o cadastro junto ao aplicativo, o USUÁRIO concorda integralmente com a coleta de dados conforme a Lei e com a Política de Segurança e Privacidade da EMPRESA.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n5. DA LICENÇA DE USO E CÓPIA\n',
                        ),
                        TextSpan(
                          text:
                              'O USUÁRIO poderá acessar todo o conteúdo do aplicativo disponível para ele, como visualizar produtos, realizar pedidos, salvar produtos em um carrinho de compras, e serviços que possam ser implementados, não significando nenhum tipo de cessão de direito ou permissão de uso, ou de cópia de informações de propriedade da EMPRESA e do DESENVOLVEDOR.'
                              'Todos os direitos são preservados, conforme a legislação brasileira, principalmente na Lei de Direitos Autorais (regulamentada na Lei nº 9.610/18), assim como no Código Civil brasileiro (regulamentada na Lei nº 10.406/02), ou quaisquer outras legislações aplicáveis.'
                              'Todo o conteúdo do aplicativo é protegido por direitos autorais, e seu uso, cópia, transmissão, venda, cessão ou revenda, deve seguir a lei brasileira, tendo a EMPRESA e o DESENVOLVEDOR todos os seus direitos reservados, e não permitindo a cópia ou utilização de nenhuma forma e meio, sem autorização expressa e por escrita da mesma.'
                              'A EMPRESA poderá em casos concretos permitir pontualmente exceções a este direito desde que referentes apenas as informações da empresa que ela mesmo disponibilizou, que serão claramente destacados no mesmo, com a forma e permissão de uso do conteúdo protegido. Este direito é revogável e limitado as especificações de cada caso. Os mesmos direitos se aplicam ao DESENVOLVEDOR, todo o conteudo do codigo fonte do aplicativo e quaisquer documentações e implementações que o mesmo realizou, são de sua posse, o mesmo ficando livre para distribuír a aplicação livremente.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n6. DAS OBRIGAÇÕES\n',
                        ),
                        TextSpan(
                          text:
                              'O USUÁRIO ao utilizar o aplicativo da EMPRESA, concorda integralmente em: '
                              'De nenhuma forma ou meio realizar qualquer tipo de ação que tente invadir, hackear, destruir ou prejudicar a estrutura do aplicativo, ou quaisquer das ferramentas interligadas ao aplicativo. Incluindo-se, mas não se limitando, ao envio de vírus de computador, de ataques de DDOS, de acesso indevido por falhas da mesma ou quaisquer outras forma e meio.'
                              'De não realizar divulgação indevida'
                              'Da proibição em reproduzir qualquer conteúdo do aplicativo sem autorização expressa, podendo responder civil e criminalmente pelo mesmo.'
                              'Com a Política de Privacidade do aplicativo, assim como os dados referentes ao cadastro, podendo a qualquer momento e forma, requerer a exclusão dos mesmos, através de contato com a loja.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n7. DOS TERMOS GERAIS\n',
                        ),
                        TextSpan(
                          text:
                              'O aplicativo poderá apresentar rotas durante toda a sua navegação, que podem levar diretamente para outra página da EMPRESA ou para sites externos.'
                              'Quaisquer problemas com a aquisição de produtos é de responsabilidade da EMPRESA e do USUÁRIO, o DESENVOLVEDOR apenas verifica e monitora o fluxo das operações quando necessários, quaisquer problemas judiciais devem ser analisados com cautela para apurar e verificar os devidos responsaveis'
                              'Apesar da EMPRESA se responsabilizar em apenas criar links para sites externos de extrema confiança, caso o usuário acesse um site externo, a EMPRESA não tem nenhuma responsabilidade pelo meio, sendo uma mera indicação de complementação de conteúdo, ficando o mesmo responsável pelo acesso, assim como sobre quaisquer ações que venham a realizar neste aplicativo.'
                              'Este Termo de uso é valido a partir de 01 de Janeiro de 2021.\n\n',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
