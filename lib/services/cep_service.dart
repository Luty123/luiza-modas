import 'dart:io';
import 'package:dio/dio.dart';
import 'package:loja/models/cep_model.dart';

const token =
    '172c71f883c3b133b75b8c0cb57e4da0'; // Token de acesso da API do CEP aberto

class CepService {
  Future<CepAddress> getAdressFromCep(String cep) async {
    final cleanCep =
        cep.replaceAll('.', '').replaceAll('-', ''); // Limpa os caracteres
    final endPoint =
        "https://www.cepaberto.com/api/v3/cep?cep=$cleanCep"; // Busca o CEP armazenado em '$cleanCep'

    final Dio dio = Dio(); // Chama o token para autenticar na API
    dio.options.headers[HttpHeaders.authorizationHeader] =
        'Token token = $token';

    try {
      final response = await dio.get<Map<String, dynamic>>(
          endPoint); // Especifica que o retorno dos dados deve ser no formato Map

// Verificar se houve resposta
      if (response.data.isEmpty) {
        return Future.error('CEP Inválido');
      }
      final CepAddress address = CepAddress.fromMap(response.data);
      return address;
//      print(response.data); // Testando
    } on DioError catch (e) {
      return Future.error(
          'Erro ao Buscar CEP'); // Caso não haja internet ou outro erro de busca
    }
  }
}
