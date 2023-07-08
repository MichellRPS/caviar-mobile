import 'package:flutter/material.dart';

import '../model/autenticacao_model.dart';
import './cardapio_view.dart';
import './clientes_cadastrar_view.dart';
import '../widgets/botao.dart';
import '../widgets/campo_formulario.dart';
import '../widgets/layout.dart';
import '../constantes.dart';

class AutenticacaoView extends StatefulWidget {
  static const rota = '/';

  const AutenticacaoView({super.key});

  @override
  State<AutenticacaoView> createState() => _AutenticacaoViewState();
}

class _AutenticacaoViewState extends State<AutenticacaoView> {
  AutenticacaoModel autenticacaoModel = AutenticacaoModel();
  final GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>();
  bool carregando = false;

  @override
  Widget build(BuildContext context) {
    return Layout(
      botaoVoltar: false,
      carregando: carregando,
      conteudo: Form(
        key: _chaveFormulario,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Botao(
                altura: MediaQuery.of(context).size.height * 0.15,
                pressionar: () {},
                texto: 'Delivery Caviar',
              ),
              Column(
                children: [
                  CampoFormulario(
                    aoSalvar: (valor) {
                      autenticacaoModel.email = valor;
                    },
                    textoDica: 'Digite o seu e-mail',
                    textoRotulo: 'E-mail',
                    validar: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Digite o seu e-mail';
                      }

                      if (valor.length > 100) {
                        return 'O e-mail pode conter no máximo 100 caracteres';
                      }

                      if (!valor.contains('@') || !valor.contains('.')) {
                        return 'O e-mail deve ser válido';
                      }

                      return null;
                    },
                  ),
                  CampoFormulario(
                    aoSalvar: (valor) {
                      autenticacaoModel.senha = valor;
                    },
                    ocultarTexto: true,
                    textoDica: 'Digite a sua senha',
                    textoRotulo: 'Senha',
                    validar: (valor) {
                      if (valor == null || valor.isEmpty) {
                        return 'Digite a sua senha';
                      }

                      if (valor.length > 100) {
                        return 'A senha pode conter no máximo 100 caracteres';
                      }

                      return null;
                    },
                  ),
                ],
              ),
              Botao(
                pressionar: () async {
                  if (!_chaveFormulario.currentState!.validate()) {
                    return;
                  }

                  setState(() {
                    carregando = true;
                  });

                  try {
                    _chaveFormulario.currentState!.save();

                    var usuario = await autenticacaoModel.autenticar();
                    
                    if (usuario != null) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacementNamed(
                        context,
                        CardapioView.rota,
                        arguments: usuario,
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      exibirMensagem(
                        context,
                        'Erro',
                        'E-mail e/ou senha incorretos',
                      );
                    }
                  } catch (error) {
                    print(error);
                    exibirMensagem(context, 'Erro', mensagemErro);
                  }

                  setState(() {
                    carregando = false;
                  });
                },
                texto: 'Acessar',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ainda não tem cadastro?',
                    style: estiloFonteTexto,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ClientesCadastrarView.rota);
                    },
                    child: const Text(
                      'Crie sua conta agora',
                      style: estiloTextButton,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      titulo: 'Autenticação',
      usuario: null,
    );
  }
}
