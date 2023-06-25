import 'package:http/http.dart' as http;

class FuncionarioModel {
  final String? nome;
  final String? sobrenome;
  final String? email;
  final String? senha;
  final String? cpf;
  final String? dataNascimento;
  final String? celular;

  FuncionarioModel({
    this.nome,
    this.sobrenome,
    this.email,
    this.senha,
    this.cpf,
    this.dataNascimento,
    this.celular,
  });

  Future<void> salvar() async {
    try {
      var urlString =
          'https://menu-caviar.000webhostapp.com/add.php/funcionarios';
      urlString += '?nome=$nome';
      urlString += '&sobrenome=$sobrenome';
      urlString += '&email=$email';
      urlString += '&senha=$senha';
      urlString += '&cpf=$cpf';
      urlString += '&data_nascimento=$dataNascimento';
      urlString += '&celular=$celular';

      await http.post(Uri.parse(urlString));
    } catch (error) {
      rethrow;
    }
  }
}
