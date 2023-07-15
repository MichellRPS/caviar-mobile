import 'package:flutter/material.dart';

import '../model/produto_model.dart';
import '../constantes.dart';

class CardapioProduto extends StatelessWidget {
  final ProdutoModel produto;

  const CardapioProduto({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cinza,
        ),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: cinzaEscuro,
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            Text(
              produto.nome!,
              style: estiloFonteTexto,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: vermelho,
              ),
              height: MediaQuery.of(context).size.height * 0.0425,
              width: MediaQuery.of(context).size.width * 0.39,
              child: Center(
                child: Text(
                  'R\$ ${produto.precoUnitario!}',
                  style: estiloFonteBotao1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
