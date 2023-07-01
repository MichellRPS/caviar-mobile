// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart';

class ClientesModel {
  String? id;
  String? nome;
  String? sobrenome;
  String? email;
  String? senha;
  String? cpf;
  String? data_nascimento;
  String? celular;

  ClientesModel({
    this.id,
    this.nome,
    this.sobrenome,
    this.email,
    this.senha,
    this.cpf,
    this.data_nascimento,
    this.celular,
  });

  Future<void> salvar() async {
    try {
      await post(
        Uri.parse('https://menu-caviar.000webhostapp.com/add.php/clientes'),
        body: {
          'nome': nome,
          'sobrenome': sobrenome,
          'email': email,
          'senha': senha,
          'cpf': cpf,
          'data_nascimento': data_nascimento,
          'celular': celular,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
    } catch (error) {
      rethrow;
    }
  }
}
