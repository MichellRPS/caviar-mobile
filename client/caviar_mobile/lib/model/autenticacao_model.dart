import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoModel {
  String? email;
  String? senha;

  AutenticacaoModel({this.email, this.senha});

  Future<bool> autenticar() async {
    try {
      var resposta = await http.post(
        Uri.parse('https://menu-caviar.000webhostapp.com/auth.php/login'),
        body: {
          'email': email,
          'senha': senha,
        },
        encoding: Encoding.getByName('utf-8'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );

      Map<String, dynamic> dados = jsonDecode(resposta.body);

      if (dados['status'] == 'success') {
        Map<String, dynamic> usuario = dados['usuario'];

        var shared = await SharedPreferences.getInstance();
        shared.setString(
          'usuario',
          jsonEncode({
            'id': usuario['id'],
            'nome': usuario['nome'],
            'sobrenome': usuario['sobrenome'],
            'email': usuario['email'],
            'senha': usuario['senha'],
            'cpf': usuario['cpf'],
            'data_nascimento': usuario['data_nascimento'],
            'celular': usuario['celular'],
            'tipo': usuario['tipo'],
          }),
        );

        return true;
      }

      return false;
    } catch (error) {
      rethrow;
    }
  }
}
