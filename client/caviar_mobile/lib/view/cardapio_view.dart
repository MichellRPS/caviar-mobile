import 'package:flutter/material.dart';

import './funcionario_cadastrar_view.dart';
import '../widgets/app_bar_customizada.dart';

class CardapioView extends StatelessWidget {
  static const String rota = '/';

  const CardapioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizada(textoTitulo: 'Cardápio'),
      backgroundColor: const Color(0xFFFFFFFF),
      body: ElevatedButton(
        child: const Text('Funcionário'),
        onPressed: () {
          Navigator.pushNamed(context, FuncionarioCadastrarView.rota);
        },
      ),
    );
  }
}
