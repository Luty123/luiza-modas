Loja Virtual.
Projeto de um aplicativo mobile de uma loja virtual para a empresa Luíza Modas.
# Loja virtual Luíza Modas - Desenvolvido por Luciano Paiva Eufrázio.
Projeto desenvolvido em Dart, utilizando o Framework Flutter e integração com Firebase.
Este projeto é uma pratica dos conhecimentos obtidos ao aprender a linguagem de programação Dart, o framework Flutter, e o Firebase (SaaS). Também é um método para aprimorar e aprender sobre as novas atualizações do framework Flutter.
Essa aplicação tem o intuito de servir de base para apresentação em algumas disciplinas abordadas no curso de Sistemas de informação da Universidade Federal do Oeste do Pará, também é um projeto pessoal que vem sendo desenvolvido desde 2019 e agora no ano de 2022 será concluído sua primeira fase.
O projeto passou pelas etapas: Coleta e análise de requisitos; escolha das tecnologias; protótipo; scrum (adaptado) para gerenciar as etapas e validações; implementação; testes.
A arquitetura MVC foi utilizada, onde o Firebase ficou responsável pela camada Model, e o Framework Flutter pelas camadas Controller e View.
A gerência de estados da aplicação possui 2 estados, cliente autenticado (logado), cliente observador (deslogado), o ScopedModel foi utilizado na gerencia de estados
Caso deseje utilizar o projeto, por favor, dê os devidos créditos e referencie o desenvolvedor.
Verifique as versões das dependências e tente manter elas como estão para evitar bugs.

<div align="center">
<img src="https://user-images.githubusercontent.com/46456708/149637481-48923122-9db1-4b22-9e56-ac17d5ff06de.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637485-efca9e50-7141-48e2-8d66-6a5d1657fbd7.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637487-9ebffd63-405d-4bf9-a17f-0565f03262b2.jpg" width="150px" />
  <h1></h1>
  <img src="https://user-images.githubusercontent.com/46456708/149637488-6b1c2465-ec06-46c8-bb7a-33c8fc69d6fc.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637489-9e01efb6-cb58-4072-9774-7fed28735bf8.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637491-c2e8dc8e-a1e7-4f4b-b0ce-a4017c8bba00.jpg" width="150px" />
  <h1></h1>
  <img src="https://user-images.githubusercontent.com/46456708/149637492-f5d58648-7ea8-479e-927f-c4697428b914.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637493-221bb57d-9346-4ba0-8f97-6235f155dfd1.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637494-f2fc7e95-a3d4-4667-b308-7bb48801e8e7.jpg" width="150px" />
  <h1></h1>
  <img src="https://user-images.githubusercontent.com/46456708/149637496-c8e4af0a-4306-48e0-a249-47d9e19ab4a2.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637497-a8532e13-ac54-4298-abd3-2a03b41ca016.jpg" width="150px" />
  <img src="https://user-images.githubusercontent.com/46456708/149637498-26e45e34-c9b8-4138-a4f4-3a2dcce1fe4a.jpg" width="150px" />
  <h1></h1>
  <img src="https://user-images.githubusercontent.com/46456708/149637499-a865c13c-2836-4abc-9014-e45ecfecfc68.jpg" width="150px" />
</div>

Getting Started.

Preparando o ambiente para receber o projeto
• Android Studio devidamente instalando no sistema operacional utilizado o Para mais informações, consultar https://developer.android.com/studio • Instalar um virtual device através do Android Studio, o virtual device utilizado e suas características utilizado no projeto, podem ser vistos no documento de visão deste projeto na seção 6. Restrições técnicas e tecnologias. o Para mais informações de como instalar um virtual device pelo Android Studio, consultar https://developer.android.com/studio/run/managing-avds?hl=pt-br • Editor de código devidamente instalado. Neste projeto foi utilizado o VS Code. o Parar mais informações, consultar https://code.visualstudio.com/ • Flutter devidamente instalado no sistema operacional. o Para mais informações sobre como instalar o flutter, consultar https://flutter.dev/docs/get-started/install • Instale o git bash no windows para melhor manipulação da camada de emulação para Git (Opcional) o Para mais informações consultar https://gitforwindows.org/

Obtendo o projeto
• O projeto pode ser acessado através da plataforma de gerencia de versionamento Github, o link para o projeto é https://github.com/Luty123/luiza-modas.git • Crie uma pasta localmente no seu sistema, • Através do link no GitHub, clone o projeto o Sugestão, escolha o método HTTPS, copie o link passado • Abra o Git Bash ou outro terminal de sua preferência na pasta local criada. o Você pode abrir seu editor de código e executar os passos seguintes nele, caso ele possua um terminal de acesso que possibilite a utilização de comando Git • Execute o comando “git clone” e cole o link copiado do Github, como no exemplo abaixo o git clone https://github.com/Luty123/luiza-modas.git

Configurando o projeto • Abra o projeto clonado no seu editor de código. • Troque a branch do projeto para a Branch “MASTER” o Utilize o comando git checkout master • Faça os seguintes comandos para preparar o flutter o flutter channel dev o flutter upgrade - (para atualizar os packages) o flutter channel stable – (para obter um canal estavel) o flutter pub get – (para obter as devidas dependências atualizadas). o Flutter doctor – (para obter um diagnostico se o flutter está devidamente configurado no sistema), para mais informações sobre o flutter doctor, consulte https://flutter.dev/docs/get-started/install/windows • Salve o projeto, feche o editor e abra novamente para que o flutter inicie o projeto com as devidas atualizações Observação. O comando flutter pub get atualiza as dependências (plugins) do projeto, em alguns casos isso pode gerar erros no código, caso isso aconteça ajuste as dependências da seguinte forma: • Na pasta do projeto procure pelo arquivo pubspec.yaml • Procure pelo seguinte trecho e ajuste as dependências de acordo com as versões abaixo pois são compatíveis com o projeto dependencies: cloud_firestore: ^0.16.0 search_cep: ^3.0.0+2 firebase_core: ^0.7.0 flutter_staggered_grid_view: ^0.3.4 carousel_pro: ^1.0.0 transparent_image: ^1.0.0 scoped_model: ^1.1.0 url_launcher: ^5.7.10 firebase_auth: ^0.20.0+1 google_fonts: ^1.1.2 cupertino_icons: ^1.0.0 #google_sign_in: ^4.5.9
• Após ajustar, execute o comando flutter pub get

Executando o projeto
• Abra o projeto com o editor de código • Verifique se o virtual device ou disposto device está carregado • Execute o projeto em seu editor ou utilize o terminal dentro da pasta do projeto executando o comando flutter run
