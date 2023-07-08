import 'dart:convert';

import 'package:http/http.dart' as http;

class AutenticacaoModel {
  String? email;
  String? senha;

  AutenticacaoModel({this.email, this.senha});

  Future<Map<String, dynamic>?> autenticar() async {
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
        return dados['usuario'];
      }

      return null;
    } catch (error) {
      rethrow;
    }
  }
}
