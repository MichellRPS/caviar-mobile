import 'package:flutter/material.dart';

import '../model/produto_model.dart';
import '../widgets/cardapio_produto.dart';
import '../widgets/layout.dart';
import '../constantes.dart';

class CardapioView extends StatefulWidget {
  static const String rota = '/cardapio';

  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  bool carregando = true;
  List<ProdutoModel> produtos = [];

  @override
  void didChangeDependencies() async {
    var resposta = await ProdutoModel.ler();

    setState(() {
      carregando = false;
      produtos = resposta;
    });

    super.didChangeDependencies();
  }

  List<CardapioProduto> buildCardapio() {
    List<CardapioProduto> cardapio = [];

    for (var produto in produtos) {
      cardapio.add(CardapioProduto(produto: produto));
    }

    return cardapio;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? usuario =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Layout(
      botaoVoltar: false,
      carregando: carregando,
      conteudo: produtos.isEmpty
          ? const Center(
              child: Text(
                'Algo deu errado...\nTente de novo em alguns instantes',
                style: estiloFonteTexto,
              ),
            )
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: buildCardapio(),
                ),
              ),
            ),
      titulo: 'Cardápio',
      usuario: usuario,
    );
  }
}
