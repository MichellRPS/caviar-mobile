import 'package:flutter/material.dart';

import './view/autenticacao_view.dart';
import './view/cardapio_view.dart';
import './view/clientes_cadastrar_view.dart';
import './view/clientes_endereco_view.dart';
import './view/clientes_perfil_view.dart';
import './view/funcionario_cadastrar_view.dart';
import './view/produto_cadastrar_view.dart';

void main() {
  runApp(const Caviar());
}

class Caviar extends StatelessWidget {
  const Caviar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caviar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        AutenticacaoView.rota: (contexto) => const AutenticacaoView(),
        CardapioView.rota: (contexto) => const CardapioView(),
        ClientesCadastrarView.rota: (contexto) => const ClientesCadastrarView(),
        ClientesEnderecoView.rota: (contexto) => const ClientesEnderecoView(),
        ClientesPerfilView.rota: (contexto) => const ClientesPerfilView(),
        FuncionarioCadastrarView.rota: (contexto) =>
            const FuncionarioCadastrarView(),
        ProdutoCadastrarView.rota: (contexto) => const ProdutoCadastrarView(),
      },
    );
  }
}
