import 'package:flutter/material.dart';

import '../constantes.dart';

class CardapioProduto extends StatelessWidget {
  const CardapioProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cinza,
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.425,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: cinzaEscuro,
            ),
            height: MediaQuery.of(context).size.height * 0.125,
            width: MediaQuery.of(context).size.width * 0.39,
          ),
          const Text(
            'Pizza Portuguesa',
            style: estiloFonteTexto,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: vermelho,
            ),
            height: MediaQuery.of(context).size.height * 0.0425,
            width: MediaQuery.of(context).size.width * 0.39,
            child: const Center(
              child: Text(
                'RS 59,90',
                style: estiloFonteBotao1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
