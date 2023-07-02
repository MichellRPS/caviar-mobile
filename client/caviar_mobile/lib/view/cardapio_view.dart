import 'package:flutter/material.dart';

import '../widgets/layout.dart';

class CardapioView extends StatelessWidget {
  static const String rota = '/';

  const CardapioView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      botaoVoltar: false,
      carregando: false,
      conteudo: Column(
        children: [],
      ),
      titulo: '',
    );
  }
}
