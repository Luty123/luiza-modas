import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';

class PoliticsScreen extends StatelessWidget {
  //const PoliticsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segurança e Privacidade'),
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
                    'INFORMAÇÕES GERAIS: ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Este aplicativo realiza os tratamentos de dados pessoais dos usuários cadastrados, desde a fase da sua coleta até a sua eliminação, respeitando a legislação do país onde foi criado. Atuando como controlador dos dados pessoais coletados por meio desse aplicativo, ficamos à disposição das normas trazidas na Lei Federal n. 13.709/2018, Lei Geral de Proteção de dados. '
                    'O aplicativo trabalha com medidas necessárias para trazer segurança e proteção a privacidade de seus usuários, trazendo detalhadamente a forma de atuação do aplicativo referente as etapas de coleta, armazenamento, uso, compartilhamento e divulgação dos dados pessoais dos usuários,  bem como a forma como é realizada a segurança e proteção dos dados que são coletados.'
                    'O aplicativo será tratado no decorrer dessa Política de Privacidade e Segurança como “nós “, “nos”, “conosco” e “nosso”.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '\nObservação importante\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Realizamos o tratamento dos seus dados pessoais com total responsabilidade e para demonstrar a transparência da nossa coleta e utilização de dados pessoais, disponibilizamos a política de privacidade, que contém informações necessárias esclarecedoras para os usuários do aplicativo, como:',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              'Nome do mantenedor, operador e proprietário do aplicativo de Loja Virtual Luíza Modas;'
                              'Para qual público é voltado nosso aplicativo;'
                              'A partir de qual idade é indicado absorver os conteúdos do aplicativo;'
                              'Quais os dados são coletados;'
                              'O que é feito com os dados coletados?'
                              'Como ocorre o tratamento dos dados coletados?'
                              'É possível o compartilhamento ou publicação dos dados por terceiros?'
                              'Formas de entrar em contato conosco.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\nSobre a nossa Loja Virtual\n',
                        ),
                        TextSpan(
                          text:
                              'Nossa loja virtuaal tem como principal objetivo disponilizar nossos produtos como em uma vitrine virtual, e atuar por meio do anuncio de promoções, novidades, descontos e notificações.'
                              'De forma responsável, o aplicativo declara assumir  compromisso total com a segurança e privacidade dos dados de seus clientes, durante todo o período de uso da plataforma. Esta política de privacidade e segurança tem como principal objetivo esclarecer e demonstrar seriedade e compromisso de como todas as informações, aqui coletadas, serão tratadas.'
                              'Qualquer modificação em nossa Política de Privacidade é Segurança serão previamente informadas aos nossos desenvolvedores que posteriormente irão atualizar no aplicativo, para que os usuários de forma imediata sejam informados.'
                              'Ao acessar o nosso aplicativo, o usuário concorda, aceita e adere de forma automática todas as informações e condições previstas neste documento, que pode ser denominado como Política de Privacidade e Segurança, além dos Termos de Uso, que devem ser obrigatoriamente respeitados e disponibilizados para consulta.'
                              'Essa areá do aplicativo traz abaixo todas as regras e termos referente a privacidade e o uso da Loja Virtual, qualquer comunicado posterior será notificado de forma expressa aos nossos usuários, como já citado.'
                              'A empresa está à disposição para esclarecer quaisquer dúvidas.'
                              'O nosso aplicativo é indicado para pessoas a partir de 18 anos, que possuam capacidade de realizar operações de compra. Caso seja menor que 18 anos, é necessário a permissão do responsável legal.'
                              'O conteúdo da nossa loja é produzido por nossa equipe respeitando os valores éticos e humanos, bem como os princípios morais, buscando informar da melhor maneira a respeito dos produtos que trazemos.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\nDADOS COLETADOS',
                        ),
                        TextSpan(
                          text:
                              '\n\nNossa Loja Virtual coleta alguns dados e informações dos nossos usuários, como será explicado abaixo neste tópico.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Dados pessoais do usuário: ',
                        ),
                        TextSpan(
                          text:
                              'Os dados pessoais do usuário coletados por nossa loja, são fornecidos exclusiva e expressamente pelo usuário, exceto previsões mencionadas abaixo, contudo, só serão coletados e tratados com o consentimento do usuário.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Coleta de dados: ',
                        ),
                        TextSpan(
                          text:
                              'A coleta de dados realizada por nossa Loja Virtual acontece ou pode acontecer em todas as páginas, no momento do preenchimento de formulários ou informações de compra de produtos como produtos escolhidos, quantidades, valores de compras, vale ressaltar que isso não inclui informações sensiveis como dados de cartão de credito, contas bancarias, CPD e etc.'
                              'O usuário do nosso aplicatvo ao acessa-lo e preencher qualquer dos formulários que surgirem, demonstra de forma expressa e clara concorda e dá seu consentimento para a coleta e os demais tratamentos de seus dados.'
                              'O nosso site coletará informações dos usuários, como nome completo, endereço, telefone do usuário, e-mail, entre outros dados que são coletados com o preenchimento dos formulários de cadastro ou requisitados durante possivel compra.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              '\n\n     Coleta automática de dados pessoais: ',
                        ),
                        TextSpan(
                          text:
                              'Podemos nonitorar nosso aplicativo com analytics, pretendemos trabalhar com a coleta de alguns dados dos usuários de forma automática, mas esses dados são computados apenas para conhecermos melhor o nosso público e termo conhecimento a respeito de quais posts são mais acessados.'
                              'Os dados coletados  de forma automática são tratados com segurança e respeitando a privacidade de nossos usuários, sendo coletados diretamente pelo sistema.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Finalidade da Coleta de dados: ',
                        ),
                        TextSpan(
                          text:
                              'Todos os dados fornecidos por nossos usuários são utilizados unicamente com a finalidade de prestação de serviço e melhor desempenho, pois através dos dados coletados podemos elaborar de forma mais direcionada nossos produtos, não buscamos nenhuma espécie de vantagem sobre eles.'
                              'Os dados fornecidos para que entremos em contato são utilizados unicamente para essa finalidade.'
                              'A Coleta de dados ocorre também para podermos enviar novidades ou serviços que desempenhamos, mas sempre com o consentimento do usuário, já que é necessário o preenchimento de formulário.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Dados que não são coletados: ',
                        ),
                        TextSpan(
                          text:
                              'Nossa Loja Virtual não trabalha com a coleta de dados sensíveis, pois só utilizamos de fato o que é necessário para a realização dos nossos serviços.'
                              'Os dados sensíveis, como a etnia, religião e genética, dados bancário e de cartão de credito, como estão estabelecidos na Lei de Proteção Geral de Dados não são coletados ou requeridos pela nossa página.'
                              'Os dados sensíveis só serão coletados por nós em casos expressamente necessários e previstos na legislação supracitada, sendo informado ao usuário a respeito dessa coleta, do modo como ocorrerá o tratamento e a finalidade da coleta desses dados sensíveis.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              '\n\n     Compartilhamento, publicação ou divulgação dos dados dos usuários a terceiros: ',
                        ),
                        TextSpan(
                          text:
                              'Trabalhamos sempre pensando no bem-estar do nosso usuário, por esse motivo, utilizamos a boa-fé como base para divulgação de nossos produtos.'
                              'Não trabalhamos com compartilhamento, publicação ou divulgação de dados que coletamos dos nossos usuários.'
                              'É permitido o acesso aos dados coletados por nós, a um terceiro que tenha permissão do titular dos dados.'
                              'Em caso de investigação criminal deixamos cientes todos os nossos usuários de que cooperaremos da forma que nos for requisitada.'
                              'Não podemos recusar compartilhar dados nos casos acima mencionados.'
                              'Por trabalharmos com parceiros é importante informar, que o nosso aplicativo pode ter links ou hiperlinks para locais externos que não possuem nenhum vínculo com o modo operacional ou com o sistema do nosso aplicativo, possuindo inclusive, Politica de Privacidade e Segurança diferente do nosso.'
                              'Os locais (sites, outros aplicativos, etc.) externos trabalham conforme estabelecido nos seus termos de uso, informamos que não temos nenhum poder de caracterizar o modo como acontece a coleta, o tratamento e a eliminação dos dados armazenados pelos locais externos.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Armazenamento de dados: ',
                        ),
                        TextSpan(
                          text:
                              'Todos os dados que armazenamos tem uma finalidade legitima e que é informada previamente aos nossos usuários, sendo armazenados apenas após o consentimento do usuário e respeitando o que prevê a legislação vigente sobre esse assunto.'
                              'Nós armazenamos dados dos nossos usuários em busca de gerar uma experiência melhor para eles ao acessarem a Loja Virtual, para ter controle da dinâmica em nossas ofertas e produtos.'
                              'Os dados armazenados para comunicar as atualizações do nosso blog todos são armazenados com segurança e expressamente para essa finalidade.'
                              'Os dados que coletamos e tratamos são utilizados por um período de tempo adequado a finalidade que é descrita neste documento.'
                              'O armazenamento dos dados realizado por nós, não retira qualquer direito do titular dos dados pessoais sobre ele. Além disso, respeitamos todos os direitos do controlador do aplicativo e as demais disposições reguladoras ou legais que versem sobre esse assunto.'
                              'Os dados armazenados por nós são tratados com toda segurança para promover a proteção do nosso usuário de qualquer evento danoso.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Tratamento de dados: ',
                        ),
                        TextSpan(
                          text:
                              'O tratamento dos dados coletados por nossa plataforma respeita todas as normas estabelecidas na Lei Geral de Proteção de Dados, respeitando o direito do usuário de ter acesso aos seus dados e solicitar para alterá-los a qualquer momento durante nosso armazenamento.'
                              'Os dados tratados por nós estão todos seguros, pois utilizamos técnicas para preservar a privacidade de todos os titulares dos dados coletados.'
                              'Não realizamos nenhum tratamento de dados ilícito ou que vá contra o que estabelece as normas brasileiras e esta Política de Privacidade e Segurança.'
                              'As etapas dos tratamentos de dados inicia-se desde a sua coleta.'
                              'As atividades referente ao tratamento de dados realizadas por nós, tem base legal para acontecer, respeitando os limites previstos na legislação.'
                              'Você pode entrar em contato conosco pela aba LOJAS',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Eliminação dos dados armazenados: ',
                        ),
                        TextSpan(
                          text:
                              'Os dados são armazenados apenas durante o período em que são utilizados para a finalidade específica para qual foram coletados, após esse período realizamos a eliminação dos dados do nosso sistema ou os anonimizamos.'
                              'Não temos nenhum interesse em continuar armazenando os dados dos nossos usuários após o período necessário para o fim que foram coletados.'
                              'O armazenamento de dados continuará ainda que a finalidade tenha sido realizada, quando houver disposição legal a respeito disso ou disposição regulatória que impeçam a sua eliminação ou anonimização. '
                              'A anonimização dos dados realizados pelo nosso site é uma maneira de manter a segurança dos dados coletados dos nossos usuários após a finalidade para qual a coleta aconteceu for alcançada.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Segurança no tratamento dos dados: ',
                        ),
                        TextSpan(
                          text:
                              'Os nossos sistemas de proteção atendem a todos os requisitos trazidos na Lei 13.709/2018, respeitando as condutas de boa prática, as medidas de segurança técnicas e administrativas para proteção dos dados coletados.'
                              'Temos muito cuidado e preocupação em proporcionar segurança aos dados coletados dos nossos usuários, por esse motivo utilizamos ferramentas específicas para garantir a privacidade dos dados que tratamos.'
                              'As técnicas utilizadas para assegurar a segurança dos dados coletados por nosso aplicativo são todas adequadas e aptas a gerar a proteção integral dos dados dos usuários de qualquer possível situação onde possa ser obtido os dados, compartilhados, publicados, destruídos e alterados sem autorização e de maneira irregular.'
                              'O acesso físico aos nossos arquivos só acontece quando é necessário que algum de nossos funcionários tenham acesso a eles para desempenhar sua função profissional.'
                              'Os dados anonimizados não são considerados pelo nosso aplicativo como informações pessoais, visto que através deles não é possível criar nenhum vínculo com o titular dos dados, já que não há como identificá-lo.'
                              'Os dados anonimizados são mantidos em nossos arquivos e sistemas com segurança.'
                              'É importante informar que tomamos cuidados para proteger os dados de nossos usuários, mas ainda assim, há algumas situações que acontecem onde há o vazamento de dados. O nosso aplicativo não é responsável por qualquer incidente com dados pessoais que aconteça por situação em que não temos o controle, como a culpa exclusiva do usuário, ou ataques de hackers.'
                              'Qualquer incidente que cause danos aos dados pessoais dos usuários, informaremos as autoridades responsáveis, conforme a Lei 13.709/2018.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Consentimento do usuário: ',
                        ),
                        TextSpan(
                          text:
                              'O usuário permite de livre e espontânea vontade que seus dados sejam coletados por nossa Loja Virtual e armazenados pelo período necessário para  realização da finalidade estabelecida.'
                              'O usuário afirma que não sofreu qualquer coação,  ou foi induzido a concordar com essa Política de Privacidade e segurança.'
                              'O usuário pactua que navegará e utilizará adequadamente os conteúdos de nossos produtos, agindo de boa-fé e respeitando uma conduta digna e respeitosa, sem realizar atitudes discriminatórios a respeito de temas religiosos, raciais, terroristas, jogos proibidos e etc.'
                              'O usuário compromete-se a não causar nenhum dano ao a loja, não devendo disseminar vírus que causem  dano aos hardware e softwares dos nossos parceiros e ao nosso aplicativo.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Futuras alterações neste documento: ',
                        ),
                        TextSpan(
                          text:
                              'Está Política de Privacidade e Segurança segue as regras trazidas na legislação brasileira, especialmente as presentes na Lei Geral de Proteção de Dados.'
                              'Não há um período específico para ocorrer qualquer modificação neste texto, por esse motivo informamos ser livre o nosso direito de alteração a qualquer momento, principalmente no caso de alterações feitas na legislação brasileira ou na nosa loja.'
                              'Nós comprometemos a informar aos nossos usuários a respeito de qualquer alteração que aconteça nesta Política de Privacidade e Segurança.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              '\n\n     Formas de entrar em contato conosco: ',
                        ),
                        TextSpan(
                          text:
                              'Buscamos sempre o melhor relacionamento com o nosso usuário, por esse motivo estamos a disposição para responder qualquer dúvida a respeito da nossa Política de Privacidade e segurança e a informar sobre o tratamento de dados realizados por nós. '
                              'Você pode entrar em contato conosco futuramente através de email, telefone ou endereço disposto na aba LOJAS.',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '\n\n     Informações adicionais: ',
                        ),
                        TextSpan(
                          text:
                              'Este documento foi desenvolvido pelo Advogado Diego Castro (OAB/PI 15.613) e modificado com permissão para este aplicativo por Luciano Paiva Eufrázio, com a função de explicitar e orientar os nossos usuários a respeito da Política de Privacidade e Segurança utilizada por nossa Loja Virtual.'
                              'Esperamos que tenha ficado claro todos os pontos debatidos neste documento.'
                              'Está Política de Privacidade e Segurança passa a ter validade a partir de 01 de Janeiro de 2022 com validade indeterminada.',
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
