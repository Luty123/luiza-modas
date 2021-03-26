# loja virtual - Modelo usado, loja de vestuário denominada nayra_fashion_village.

Projeto de aplicação mobile de uma loja virtual.
# Nayra Fashion Village - Desenvolvido por Luciano Paiva Eufrázio.
02/2021 -

Projeto desenvolvido em Dart, utilizando o Framework Flutter com integração da plataforma de auxílio ao desenvolvimento Firebase.

## About us.
Este projeto é uma pratica dos conhecimentos obtidos ao aprender a linguagem de programação Dart, o framework Flutter, juntamente a plataforma de auxílio ao desenvolvimento Firebase. Também é um método para aprimorar e aprender sobre as novas atualizações do framework Flutter.
Essa aplicação tem o intuito de servir de base para apresentação em algumas disciplinas abordadas no curso de Sistemas de informação, além de que, será amplamente implementada e terá continuidade com adições e aprimoramentos, para se tornar um sistema mais completo, sendo este sistema vinculado a outro aplicativo voltado para administradores. Ambos os aplicativos serão utilizados em testes reais em uma loja de vestuário variado.

O projeto será dividido em três fases, a primeira se trata de desenvolver a loja virtual, para clientes, criando uma aplicação local para testes de funcionalidades e desenvolvimento em geral, sendo aprimorada com os conhecimentos coletados. Essa primeira tem o intuito de estabelecer 3 módulos de implementação para clientes, esses módulos são descritos no Documento de visão do projeto.
A segunda fase será a de implementação do aplicativo para administradores, que tem o objetivo de automatizar algumas tarefas feitas no firebase. O usuário administrador poderá gerenciar os cadastros referentes a sua loja, gerenciar os pedidos realizados pelos usuários e gerenciar os produtos cadastrados na loja virtual.
A terceira fase é a de estilização e aprimoramento das funcionalidades, ainda está em fase de planejamento, mas alguns sistemas são potenciais alvos de serem implementados, como sistema de compra direto pelo (por boleto, cartão de credito, pix, entre outros), aprimoramento de calculo de frete, sistema de notificações, login com outros sistemas, como Facebook, e aprimoramento da usabilidade e padronização do layout da UI do sistema.
Essas etapas se fazem necessárias para compreensão e planejamento adequado para tornar a aplicação viável para uso real e hospedagem em lojas virtuais, como Play Store e Apple Store.
Parar mais informações acerca do projeto, consultar o Documento de visão.


### Getting Started.
1.	Preparando o ambiente para receber o projeto

•	Android Studio devidamente instalando no sistema operacional utilizado
o	Para mais informações, consultar https://developer.android.com/studio 
•	Instalar um virtual device através do Android Studio, o virtual device utilizado e suas características utilizado no projeto, podem ser vistos no documento de visão deste projeto na seção 6. Restrições técnicas e tecnologias.
o	Para mais informações de como instalar um virtual device pelo Android Studio, consultar https://developer.android.com/studio/run/managing-avds?hl=pt-br 
•	Editor de código devidamente instalado. Neste projeto foi utilizado o VS Code.
o	Parar mais informações, consultar https://code.visualstudio.com/ 
•	Flutter devidamente instalado no sistema operacional.
o	Para mais informações sobre como instalar o flutter, consultar https://flutter.dev/docs/get-started/install 
•	Instale o git bash no windows para melhor manipulação da camada de emulação para Git (Opcional)
o	Para mais informações consultar https://gitforwindows.org/ 

2.	Obtendo o projeto

•	O projeto pode ser acessado através da plataforma de gerencia de versionamento Github, o link para o projeto é https://github.com/Luty123/nayra_modas 
•	Crie uma pasta localmente no seu sistema, 
•	Através do link no GitHub, clone o projeto
o	Sugestão, escolha o método HTTPS, copie o link passado
•	Abra o Git Bash ou outro terminal de sua preferência na pasta local criada.
o	Você pode abrir seu editor de código e executar os passos seguintes nele, caso ele possua um terminal de acesso que possibilite a utilização de comando Git
•	Execute o comando “git clone” e cole o link copiado do Github, como no exemplo abaixo
o	git clone https://github.com/Luty123/nayra_modas.git 

3.	Configurando o projeto
•	Abra o projeto clonado no seu editor de código.
•	Troque a branch do projeto para a Branch “MASTER”
o	Utilize o comando git checkout master
•	Faça os seguintes comandos para preparar o flutter
o	flutter channel dev
o	flutter upgrade - (para atualizar os packages)
o	flutter channel stable – (para obter um canal estavel)
o	flutter pub get – (para obter as devidas dependências atualizadas).
o	Flutter doctor – (para obter um diagnostico se o flutter está devidamente configurado no sistema), para mais informações sobre o flutter doctor, consulte https://flutter.dev/docs/get-started/install/windows 
•	Salve o projeto, feche o editor e abra novamente para que o flutter inicie o projeto com as devidas atualizações
Observação. O comando flutter pub get atualiza as dependências (plugins) do projeto, em alguns casos isso pode gerar erros no código, caso isso aconteça ajuste as dependências da seguinte forma:
•	Na pasta do projeto procure pelo arquivo pubspec.yaml
•	Procure pelo seguinte trecho e ajuste as dependências de acordo com as versões abaixo pois são compatíveis com o projeto
dependencies:
  cloud_firestore: ^0.16.0
  search_cep: ^3.0.0+2
  firebase_core: ^0.7.0
  flutter_staggered_grid_view: ^0.3.4
  carousel_pro: ^1.0.0
  transparent_image: ^1.0.0
  scoped_model: ^1.1.0
  url_launcher: ^5.7.10
  firebase_auth: ^0.20.0+1
  google_fonts: ^1.1.2
  cupertino_icons: ^1.0.0
  #google_sign_in: ^4.5.9

•	Após ajustar, execute o comando flutter pub get

4.	Executando o projeto

•	Abra o projeto com o editor de código
•	Verifique se o virtual device ou disposto device está carregado
•	Execute o projeto em seu editor ou utilize o terminal dentro da pasta do projeto executando o comando flutter run