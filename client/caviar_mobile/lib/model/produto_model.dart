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

  static Future<List<ProdutoModel>> ler() async {
    List<ProdutoModel> produtos = [];

    try {
      var resposta = await get(
        Uri.parse('https://menu-caviar.000webhostapp.com/read.php/produtos'),
      );

      List<dynamic> dados = jsonDecode(resposta.body);

      if (dados.isNotEmpty) {
        for (var dado in dados) {
          produtos.add(
            ProdutoModel(
              id: dado['id'],
              idCategoria: dado['id_categoria'],
              descricao: dado['descricao'],
              imagem: dado['imagem'],
              nome: dado['nome'],
              precoUnitario: dado['preco_unitario'],
            ),
          );
        }
      }
    } catch (error) {
      rethrow;
    }

    return produtos;
  }
}
