import 'package:flutter/material.dart';

class BotaoFormulario extends StatelessWidget {
  final void Function()? salvar;
  final String textoBotao;

  const BotaoFormulario({
    required this.salvar,
    super.key,
    required this.textoBotao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: salvar,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFD3B11),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              textoBotao,
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
