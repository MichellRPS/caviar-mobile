import 'package:flutter/material.dart';

import '../constantes.dart';

class Botao extends StatelessWidget {
  final void Function()? pressionar;
  final double? altura;
  final String texto;

  const Botao({
    super.key,
    required this.pressionar,
    this.altura,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: SizedBox(
        height: altura,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: pressionar,
          style: ElevatedButton.styleFrom(
            backgroundColor: vermelho,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              texto,
              style: estiloFonteBotao1,
            ),
          ),
        ),
      ),
    );
  }
}
