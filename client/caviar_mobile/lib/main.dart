import 'package:flutter/material.dart';

import './view/cardapio_view.dart';
import 'view/funcionario_cadastrar_view.dart';
import 'view/produto_cadastrar_view.dart';

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
      initialRoute: CardapioView.rota,
      routes: {
        CardapioView.rota: (contexto) => const CardapioView(),
        FuncionarioCadastrarView.rota: (contexto) => const FuncionarioCadastrarView(),
        ProdutoCadastrarView.rota: (contexto) => const ProdutoCadastrarView(),
      },
    );
  }
}