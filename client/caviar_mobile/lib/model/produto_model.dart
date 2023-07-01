import 'dart:convert';

import 'package:http/http.dart';

class ProdutoModel {
  String? id;
  String? idCategoria;
  String? nome;
  String? descricao;
  String? imagem;
  String? precoUnitario;

  ProdutoModel({
    this.id,
    this.idCategoria,
    this.nome,
    this.descricao,
    this.imagem,
    this.precoUnitario,
  });

  Future<Response> salvar() async {
    try {
      return await post(
        Uri.parse('https://menu-caviar.000webhostapp.com/add.php/produtos'),
        body: {
          "id_categoria": "1",
          "nome": nome,
          "descricao": descricao,
          "imagem": "imagem",
          "preco_unitario": precoUnitario,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );
    } catch (error) {
      rethrow;
    }
  }
}
