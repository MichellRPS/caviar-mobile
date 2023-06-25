import 'package:flutter/material.dart';

class Carregamento extends StatelessWidget {
  const Carregamento({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Carregando...',
            style: TextStyle(
              color: Color(0xFF19191A),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          CircularProgressIndicator(
            color: Color(0xFFFD3B11),
          ),
        ],
      ),
    );
  }
}
