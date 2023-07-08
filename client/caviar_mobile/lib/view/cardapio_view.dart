import 'package:flutter/material.dart';

import '../widgets/layout.dart';

class CardapioView extends StatelessWidget {
  static const String rota = '/cardapio';

  const CardapioView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? usuario =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Layout(
      botaoVoltar: false,
      carregando: false,
      conteudo: const Column(
        children: [],
      ),
      titulo: '',
      usuario: usuario,
    );
  }
}
