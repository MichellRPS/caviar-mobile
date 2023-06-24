import 'package:flutter/material.dart';

class AppBarCustomizada extends StatelessWidget implements PreferredSizeWidget {
  final String textoTitulo;

  const AppBarCustomizada({
    super.key,
    required this.textoTitulo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xFFFD3B11),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Center(
        child: Text(
          textoTitulo,
          style: const TextStyle(
            color: Color(0xFF19191A),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
