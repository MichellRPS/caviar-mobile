import 'package:flutter/material.dart';

import './clientes_endereco_view.dart';
import '../widgets/layout.dart';
import '../constantes.dart';

class ClientesPerfilView extends StatelessWidget {
  static const String rota = '/clientes/perfil';

  const ClientesPerfilView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? usuario =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Layout(
      carregando: false,
      conteudo: Container(
        color: cinza,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: branco,
                  radius: MediaQuery.of(context).size.width * 0.15,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  usuario!['nome'] + ' ' + usuario['sobrenome'],
                  style: estiloFonteTitulo,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: branco,
                borderRadius: BorderRadius.circular(15),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Opções',
                      style: estiloFonteTitulo,
                    ),
                    const ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(
                        'Meus Pedidos',
                        style: estiloFonteTexto,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        'Configurações do Perfil',
                        style: estiloFonteTexto,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text(
                        'Atualizar Endereço',
                        style: estiloFonteTexto,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ClientesEnderecoView.rota,
                          arguments: usuario,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      titulo: 'Meu Perfil',
      usuario: usuario,
    );
  }
}
