import 'package:flutter/material.dart';

import '../model/clientes_model.dart';
import '../widgets/app_bar_customizada.dart';
import '../widgets/botao_formulario.dart';
import '../widgets/campo_formulario.dart';
import '../widgets/carregamento.dart';
import '../constantes.dart';

class ClientesCadastrarView extends StatefulWidget {
  static const String rota = '/clientes/cadastrar';

  const ClientesCadastrarView({super.key});

  @override
  State<ClientesCadastrarView> createState() => _ClientesCadastrarViewState();
}

class _ClientesCadastrarViewState extends State<ClientesCadastrarView> {
  final GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>();
  bool loading = false;
  ClientesModel cliente = ClientesModel();
  String? _confirmarSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizada(textoTitulo: 'Cadastrar Cliente'),
      backgroundColor: branco,
      body: loading
          ? const Carregamento()
          : Form(
              key: _chaveFormulario,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CampoFormulario(
                      aoSalvar: (valor) {
                        cliente.nome = valor;
                      },
                      textoDica: 'Digite o seu nome',
                      textoRotulo: 'Nome',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu nome';
                        }

                        if (valor.length > 100) {
                          return 'O nome pode conter no máximo 100 caracteres';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        cliente.sobrenome = valor;
                      },
                      textoDica: 'Digite o seu sobrenome',
                      textoRotulo: 'Sobrenome',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu sobrenome';
                        }

                        if (valor.length > 100) {
                          return 'O sobrenome pode conter no máximo 100 caracteres';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        cliente.email = valor;
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
                        cliente.senha = valor;
                      },
                      aoDigitarCaractere: (valor) {
                        cliente.senha = valor;
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

                        if (valor != _confirmarSenha) {
                          return 'As senhas devem ser iguais';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        _confirmarSenha = valor;
                      },
                      aoDigitarCaractere: (valor) {
                        _confirmarSenha = valor;
                      },
                      ocultarTexto: true,
                      textoDica: 'Confirme a sua senha',
                      textoRotulo: 'Confirmar senha',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Confirme a sua senha';
                        }

                        if (valor != cliente.senha) {
                          return 'As senhas devem ser iguais';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        cliente.cpf = valor;
                      },
                      textoDica: 'Digite o seu CPF',
                      textoRotulo: 'CPF',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu CPF';
                        }

                        if (!RegExp(r'^[0-9]+$').hasMatch(valor)) {
                          return 'O CPF deve conter apenas números';
                        }

                        if (valor.length != 11) {
                          return 'O CPF deve conter 11 números';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        cliente.data_nascimento = valor;
                      },
                      data: true,
                      textoDica: 'Selecione a sua data de nascimento',
                      textoRotulo: 'Data de nascimento',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Selecione a sua data de nascimento';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        cliente.celular = valor;
                      },
                      textoDica: 'Digite o seu número de celular',
                      textoRotulo: 'Celular',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu número de celular';
                        }

                        if (!RegExp(r'^[0-9]+$').hasMatch(valor)) {
                          return 'O número de celular deve conter apenas números';
                        }

                        if (valor.length != 11) {
                          return 'O número de celular deve conter 11 números';
                        }

                        return null;
                      },
                    ),
                    BotaoFormulario(
                      salvar: () async {
                        if (!_chaveFormulario.currentState!.validate()) {
                          return;
                        }

                        setState(() {
                          loading = true;
                        });

                        try {
                          _chaveFormulario.currentState!.save();

                          await cliente.salvar();

                          // ignore: use_build_context_synchronously
                          exibirMensagem(
                            context,
                            'Sucesso',
                            'Cliente cadastrado com sucesso',
                          );
                        } catch (error) {
                          exibirMensagem(context, 'Erro', mensagemErro);
                        }

                        setState(() {
                          loading = false;
                        });
                      },
                      textoBotao: 'Cadastrar',
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
