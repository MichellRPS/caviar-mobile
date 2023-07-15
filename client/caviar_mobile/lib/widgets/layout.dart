import 'package:flutter/material.dart';

import '../view/cardapio_view.dart';
import '../view/clientes_perfil_view.dart';
import '../view/produto_cadastrar_view.dart';
import '../constantes.dart';

class Layout extends StatelessWidget {
  final bool barraNavegacao;
  final bool botaoVoltar;
  final bool carregando;
  final Widget conteudo;
  final int indiceSelecionado;
  final String titulo;
  final Map<String, dynamic>? usuario;

  const Layout({
    super.key,
    this.barraNavegacao = true,
    this.botaoVoltar = true,
    required this.carregando,
    required this.conteudo,
    this.indiceSelecionado = 0,
    required this.titulo,
    required this.usuario,
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
      bottomNavigationBar: !barraNavegacao
          ? null
          : BottomNavigationBar(
              backgroundColor: branco,
              currentIndex: indiceSelecionado,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.edit_outlined), label: ''),
                BottomNavigationBarItem(
                  icon: Icon(Icons.inventory_2_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: '',
                ),
              ],
              onTap: (indice) {
                switch (indice) {
                  case 0:
                    if (indiceSelecionado != 0) {
                      Navigator.pushNamed(
                        context,
                        CardapioView.rota,
                        arguments: usuario,
                      );
                    }
                    break;

                  case 1:
                    print(1);
                    break;

                  case 2:
                    if (indiceSelecionado != 2) {
                      Navigator.pushNamed(
                        context,
                        ProdutoCadastrarView.rota,
                        arguments: usuario,
                      );
                    }
                    break;

                  case 3:
                    print(3);
                    break;

                  case 4:
                    if (indiceSelecionado != 4) {
                      Navigator.pushNamed(
                        context,
                        ClientesPerfilView.rota,
                        arguments: usuario,
                      );
                    }
                    break;
                }
              },
              selectedItemColor: vermelho,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: cinzaEscuro,
            ),
    );
  }
}
