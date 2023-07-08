// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class CidadesModel {
  String? id;
  String? id_estado;
  String? nome;

  CidadesModel({
    this.id,
    this.id_estado,
    this.nome,
  });

  static Future<List<CidadesModel>?> ler() async {
    try {
      var resposta = await http.get(
        Uri.parse('https://menu-caviar.000webhostapp.com/read.php/cidades'),
      );

      List<dynamic> dados = jsonDecode(resposta.body);

      if (dados.isEmpty) return null;

      List<CidadesModel> cidades = [];

      for (var cidade in dados) {
        cidades.add(
          CidadesModel(
            id: cidade['id'],
            id_estado: cidade['id_estado'],
            nome: cidade['nome'],
          ),
        );
      }

      return cidades;
    } catch (error) {
      return null;
    }
  }
}
