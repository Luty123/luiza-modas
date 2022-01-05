import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/helpers/assets.dart';
import 'package:loja/helpers/loader.dart';
import 'package:loja/helpers/validators.dart';
import 'package:loja/models/user_model.dart';
import 'package:loja/screens/declarations/politics_screen.dart';
import 'package:loja/screens/declarations/terms_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'login_screen.dart';

//Classe responsavel pela tela de cadastro de um novo usuario
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Controllers necessarios para o formulario de cadastro, cada controller é responsavel por um campo de preenchimento
  final _nameController = TextEditingController(); //Nome
  final _surnameController = TextEditingController(); //Sobrenome
  final _emailController = TextEditingController(); //Email
  final _passController = TextEditingController(); //Senha
  final _rePassController = TextEditingController(); //Repetir senha
  final _addressController = TextEditingController(); //Endereço
  final _districtAddressController = TextEditingController(); //Bairro
  final _complementAddressController = TextEditingController(); //Complemento
  final _complementCityController = TextEditingController(); //Cidade
  final _contactController = TextEditingController(); //Telefone para contato
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final String background = loginBack;
  bool _checkBoxVal = false;

  static const menuItemsState = <String>[
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO',
    'DF',
  ];
  static const menuItemsGender = <String>[
    'Homem Cisgênero',
    'Homem Transgênero',
    'Mulher Cisgênero',
    'Mulher Transgênero',
    'Outro',
    'Prefiro não responder',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItemsState = menuItemsState
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  final List<DropdownMenuItem<String>> _dropDownMenuItemsGender =
      menuItemsGender
          .map(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList();
  String _gender;
  String _state;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(background), fit: BoxFit.fill),
        ),
      ),
      GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: MaterialColors.signStartGradient,
            title: Text("CRIAR CONTA"),
            centerTitle: true,
          ),
          body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              //Verifica o estado do usuario
              if (model.isLoading)
                return Center(
                  child: Loader(),
                );
              return Form(
                key: _formKey,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(background),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      ListView(
                        padding: EdgeInsets.all(32.0),
                        children: <Widget>[
                          //TODO - LOGOMARCA animada - Em construção -
                          //Logo animada - Em construção

                          // GestureDetector(
                          //   onTap: () => _showSecondPage(context),
                          //   child: Hero(
                          //     tag: 'luiza-modas',
                          //     child: Container(
                          //       height:
                          //           MediaQuery.of(context).size.height * 0.3,
                          //       decoration: BoxDecoration(
                          //         gradient: LinearGradient(
                          //             colors: [
                          //               MaterialColors.signStartGradient,
                          //               MaterialColors.socialDribbble,
                          //             ],
                          //             end: Alignment.bottomCenter,
                          //             begin: Alignment.topCenter),
                          //         borderRadius: BorderRadius.only(
                          //           bottomLeft: Radius.circular(100),
                          //           bottomRight: Radius.circular(10),
                          //           topLeft: Radius.circular(10),
                          //           topRight: Radius.circular(100),
                          //         ),
                          //       ),
                          //       child: Stack(
                          //         children: <Widget>[
                          //           Positioned(
                          //               bottom: 10,
                          //               right: 20,
                          //               child: Text(
                          //                 'Bem Vindo(a)',
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 20),
                          //               )),
                          //           Center(
                          //             child: Image.network(
                          //               "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Flinkedin_banner_image_1.png?alt=media&token=4586b070-8b75-44c0-b915-4151fd45d84a",
                          //               height: 400,
                          //               width: 400,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 32.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                              ),
                              Text(
                                "Dados pessoais",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                            ],
                          ),
                          //Campo Primeiro nome
                          /*Validador - Verifica se o campo esta vazio
                          Como o solicitado é apenas o primeiro nome, verifica se foi dado
                          um espaço no preenchimento do campo*/
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _nameController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Primeiro nome*",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (name) {
                                /*if (text.isEmpty || text.contains(' ')) {
                                return "Nome inválido, insira apenas seu primeiro nome";
                              }*/
                                if (name.isEmpty)
                                  return 'Campo obrigatório';
                                else if (name.trim().split(' ').length > 1 ||
                                    name.contains(' '))
                                  return 'Insira apenas o seu primeiro nome';
                              },
                            ),
                          ),
                          //Campo Segundo nome
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _surnameController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Sobrenome*",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person_outline,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (name2) {
                                if (name2.isEmpty)
                                  return 'Campo obrigatório';
                                else if (name2.trim().split(' ').length < 1)
                                  return 'Insira seu sobrenome completo';
                              },
                            ),
                          ),
                          //Campo Gênero
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: ListTile(
                              title: Text(
                                'Gênero*',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: DropdownButton(
                                value: _gender,
                                hint: Text('Selecione'),
                                onChanged: ((String newValue) {
                                  setState(() {
                                    _gender = newValue;
                                  });
                                }),
                                items: _dropDownMenuItemsGender,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //Explicação - Gênero
                          SizedBox(
                            height: 140,
                            child: Container(
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.pink[50],
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text.rich(
                                TextSpan(
                                    text: 'Cisgênero:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            ' pessoa que se identifica com o gênero (homem/mulher) atribuído no nascimento.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      TextSpan(text: '\nTransgênero:'),
                                      TextSpan(
                                        text:
                                            ' pessoa que se identifica com algum gênero diferente do atribuído no nascimento.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                              ),
                              Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                            ],
                          ),
                          //Campo email
                          //Validador - Verifica se o campo esta vazio e se o email é valido//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "E-mail*",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (email) {
                                if (email.isEmpty)
                                  return "Campo obrigatorio";
                                else if (!emailValid(email))
                                  return 'E-mail inválido!';
                                return null;
                              },
                            ),
                          ),
                          //Campo Senha
                          //Validador - Verifica se o campo esta vazio e se a senha é menor que 8 digitos//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _passController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Senha*: 8 digitos ou mais",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              obscureText: true,
                              // ignore: missing_return
                              validator: (pass) {
                                if (pass.isEmpty)
                                  return "Campo obrigatorio";
                                else if (pass.length < 8)
                                  return 'Senha curta, minimo de 8 digítos';
                                return null;
                              },
                            ),
                          ),
                          //Campo Repetir Senha
                          //Validador - Verifica se o campo esta vazio e se as senhas são iguais//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _rePassController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Repetir senha*",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.vpn_key_outlined,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              obscureText: true,
                              // ignore: missing_return
                              validator: (pass2) {
                                if (pass2.isEmpty)
                                  return "Campo obrigatorio";
                                else if (pass2.length < 8)
                                  return 'Senha curta, deve conter no minimo 8 digítos';
                                else if (_rePassController.text !=
                                    _passController.text)
                                  return 'As senhas não correspondem';
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                              ),
                              Text(
                                "Endereço",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                            ],
                          ),
                          //Campo Endereço
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _addressController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "*Ex: Rua Azul, número 10",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira o nome da rua*";
                              },
                            ),
                          ),
                          //Campo Bairro
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _districtAddressController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Bairro*",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira o nome do bairro";
                              },
                            ),
                          ),
                          //Campo Complemento
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _complementAddressController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Complemento*, Ex: Entre ruas 1 e 2",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira um ponto de referência";
                              },
                            ),
                          ),

                          //Campo Cidade
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _complementCityController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Cidade*",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.streetview,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (address) {
                                if (address.isEmpty)
                                  return "Insira um ponto de referência";
                              },
                            ),
                          ),
                          //Campo Estado
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: ListTile(
                              title: Text(
                                'Selecione seu Estado*',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: DropdownButton(
                                value: _state,
                                hint: Text('Estado'),
                                onChanged: ((String newValue) {
                                  setState(() {
                                    _state = newValue;
                                  });
                                }),
                                items: _dropDownMenuItemsState,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                              ),
                              Text(
                                "Contato",
                                style: TextStyle(color: Colors.white),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                            ],
                          ),
                          //Campo Contato
                          //Validador - Verifica se o campo esta vazio//
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.pink[50],
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _contactController,
                              autofocus: true,
                              minLines: 1,
                              maxLines: 2,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Telefone*: (99) 99999-9999",
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.phone,
                                  color: MaterialColors.primary,
                                ),
                              ),
                              // ignore: missing_return
                              validator: (text) {
                                if (text.isEmpty)
                                  return "Insira um número de telefone";
                              },
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            //margin: EdgeInsets.only(left: 10),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: FormField<bool>(
                                builder: (state) {
                                  return Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Checkbox(
                                                  value: _checkBoxVal,
                                                  onChanged: (value) {
                                                    setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                                                      _checkBoxVal = value;
                                                      state.didChange(value);
                                                    });
                                                  }),
                                              Text(
                                                'Declaro que li e concordo com os\nTermos Gerais e as Políticas\nde Segurança e privacidade',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
//display error in matching theme
                                        Text(
                                          state.errorText ?? '',
                                          style: TextStyle(
                                            color: Theme.of(context).errorColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
//output from validation will be displayed in state.errorText (above)
                                validator: (value) {
                                  if (!_checkBoxVal) {
                                    return '\nVocê precisa aceitar os Termos';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => TermsScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "TERMOS",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: MaterialColors.info)),
                              ),
                              Spacer(),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PoliticsScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "POLÍTICAS",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: MaterialColors.info)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          //Tratamento de dados
                          SizedBox(
                            width: double.infinity,
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  //Obtem e mapeia os dados do formulario
                                  if (_formKey.currentState.validate()) {
                                    Map<String, dynamic> userData = {
                                      "name": _nameController.text,
                                      "surname": _surnameController.text,
                                      "email": _emailController.text,
                                      "address": _addressController.text,
                                      "district":
                                          _districtAddressController.text,
                                      "complement":
                                          _complementAddressController.text,
                                      "city": _complementCityController.text,
                                      "contact": _contactController.text,
                                      "gender": _gender,
                                      "state": _state,
                                      "igree": _checkBoxVal
                                    };

                                    //Salva os dados do formulario (UserData) para serem enviados para o banco de dados o firebase
                                    //Apos cadastro, efetua o login
                                    model.signUp(
                                        userData: userData,
                                        pass: _passController.text,
                                        onSuccess: _onSuccess,
                                        onFail: _onFail);
                                  }
                                  if (_checkBoxVal == null) {
                                    print('object');
                                  }
                                },
                                child: Text(
                                  "CRIAR CONTA".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: MaterialColors.label,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }

  //Função para informar sucesso na criação da connta e retornar para a tela inicial
  void _onSuccess() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso!"),
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 4),
      ),
    );
    Future.delayed(Duration(seconds: 2))
        .then((_) => Navigator.of(context).pop());
  }

  //Função para informar falha na criação da conta
  void _onFail() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao criar usuário!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 4),
      ),
    );
  }

  //TODO - LOGOMARCA função da animação - Em construção -
  //Função para mostrar a segunda pagina da anição da logo - Em Construção
  // ignore: unused_element
  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text(
              "Luíza Modas",
              style: TextStyle(color: MaterialColors.primary),
            ),
            centerTitle: true,
            backgroundColor: MaterialColors.signStartGradient,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Center(
            child: Hero(
              tag: 'luiza-modas',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    MaterialColors.signStartGradient,
                    MaterialColors.socialDribbble,
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        bottom: 10,
                        right: 20,
                        child: Text(
                          'Bem Vindo(a)',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    Center(
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/loja-932f6.appspot.com/o/logo%2Flinkedin_banner_image_1.png?alt=media&token=4586b070-8b75-44c0-b915-4151fd45d84a",
                        height: 400,
                        width: 400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
