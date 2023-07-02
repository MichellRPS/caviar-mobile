import 'package:flutter/material.dart';

import '../view/autenticacao_view.dart';
import '../constantes.dart';

class Layout extends StatelessWidget {
  final bool botaoVoltar;
  final bool carregando;
  final Widget conteudo;
  final String titulo;

  const Layout({
    super.key,
    this.botaoVoltar = true,
    required this.carregando,
    required this.conteudo,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: branco,
        leading: botaoVoltar
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: vermelho,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: Center(
          child: Text(
            titulo,
            style: estiloFonteTitulo,
          ),
        ),
      ),
      backgroundColor: branco,
      body: carregando
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Carregando...',
                    style: estiloFonteTexto,
                  ),
                  SizedBox(height: 10),
                  CircularProgressIndicator(
                    color: vermelho,
                  ),
                ],
              ),
            )
          : conteudo,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.edit_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: '',
          ),
        ],
        onTap: (indice) {
          switch (indice) {
            case 0:
              print(0);
              break;

            case 1:
              print(1);
              break;

            case 2:
              print(2);
              break;

            case 3:
              Navigator.pushNamed(context, AutenticacaoView.rota);
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}