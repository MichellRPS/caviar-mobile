// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

class EnderecosClientesModel {
  String? id;
  String? id_cliente;
  String? id_cidade;
  String? nome;
  String? bairro;
  String? cep;
  String? endereco;
  String? numero;

  EnderecosClientesModel({
    this.id,
    this.id_cliente,
    this.id_cidade,
    this.nome,
    this.bairro,
    this.cep,
    this.endereco,
    this.numero,
  });

  static Future<EnderecosClientesModel?> buscar(String id_cliente) async {
    try {
      var resposta = await post(
        Uri.parse(
          'https://menu-caviar.000webhostapp.com/read.php/enderecos_clientes',
        ),
        body: {
          'id_cliente': id_cliente,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      List<dynamic> dados = jsonDecode(resposta.body);

      return EnderecosClientesModel(
        id: dados[0]['id'],
        id_cliente: dados[0]['id_cliente'],
        id_cidade: dados[0]['id_cidade'],
        nome: dados[0]['nome'],
        bairro: dados[0]['bairro'],
        cep: dados[0]['cep'],
        endereco: dados[0]['endereco'],
        numero: dados[0]['numero'],
      );
    } catch (error) {
      return null;
    }
  }

  Future<bool> salvar() async {
    try {
      await post(
        Uri.parse(
          'https://menu-caviar.000webhostapp.com/add.php/enderecos_clientes',
        ),
        body: {
          'id_cliente': id_cliente,
          'id_cidade': id_cidade,
          'nome': nome,
          'bairro': bairro,
          'cep': cep,
          'endereco': endereco,
          'numero': numero,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> atualizar() async {
    try {
      await post(
        Uri.parse(
          'https://menu-caviar.000webhostapp.com/update.php/enderecos_clientes',
        ),
        body: {
          'id': id,
          'id_cliente': id_cliente,
          'id_cidade': id_cidade,
          'nome': nome,
          'bairro': bairro,
          'cep': cep,
          'endereco': endereco,
          'numero': numero,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      return true;
    } catch (error) {
      rethrow;
    }
  }
}
