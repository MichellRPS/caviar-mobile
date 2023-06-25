import 'package:flutter/material.dart';

// Rotas da API

const urlApi = 'https://menu-caviar.000webhostapp.com';
const urlCadastroFuncionario = '$urlApi/add.php/funcionarios';

// Paleta de cores

const vermelho = Color(0xFFFD3B11);
const branco = Color(0xFFFFFFFF);
const preto = Color(0xFF19191A);
const cinza = Color(0xFFE4E4E4);

// Estilos de fonte

const estiloFonteTexto = TextStyle(
  color: Color(0xFF19191A),
  fontSize: 16,
);

const estiloFonteTitulo = TextStyle(
  color: Color(0xFF19191A),
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const estiloFonteBotao1 = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const estiloFonteBotao2 = TextStyle(
  color: vermelho,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const estiloFonteErro = TextStyle(
  color: Color(0xFFFD3B11),
  fontSize: 14,
);

// Mensagem

const mensagemErro = 'Algo deu errado...\nTente de novo em alguns instantes.';

// Exibir mensagem

void exibirMensagem(
  BuildContext contexto,
  String titulo,
  String texto,
) async {
  return showDialog<void>(
    context: contexto,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          titulo,
          style: estiloFonteTitulo,
        ),
        content: Text(
          texto,
          style: estiloFonteTexto,
        ),
        actions: [
          TextButton(
            child: const Text(
              'Fechar',
              style: estiloFonteBotao2,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: branco,
      );
    },
  );
}
