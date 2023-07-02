import 'package:flutter/material.dart';

import '../model/funcionario_model.dart';
import '../widgets/app_bar_customizada.dart';
import '../widgets/botao.dart';
import '../widgets/campo_formulario.dart';
import '../constantes.dart';

class FuncionarioCadastrarView extends StatefulWidget {
  static const String rota = '/cadastrar-funcionario';

  const FuncionarioCadastrarView({super.key});

  @override
  State<FuncionarioCadastrarView> createState() =>
      _FuncionarioCadastrarViewState();
}

class _FuncionarioCadastrarViewState extends State<FuncionarioCadastrarView> {
  final GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>();
  bool loading = false;
  String? _nome;
  String? _sobrenome;
  String? _email;
  String? _senha;
  String? _confirmarSenha;
  String? _cpf;
  String? _dataNascimento;
  String? _celular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizada(textoTitulo: 'Cadastrar Funcionário'),
      backgroundColor: const Color(0xFFFFFFFF),
      body: loading
          ? const Center(
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
            )
          : Form(
              key: _chaveFormulario,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CampoFormulario(
                      aoSalvar: (valor) {
                        _nome = valor;
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
                        _sobrenome = valor;
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
                        _email = valor;
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

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        _senha = valor;
                      },
                      aoDigitarCaractere: (valor) {
                        _senha = valor;
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

                        if (valor != _senha) {
                          return 'As senhas devem ser iguais';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        _cpf = valor;
                      },
                      textoDica: 'Digite o seu CPF',
                      textoRotulo: 'CPF',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu CPF';
                        }

                        if (valor.length > 11) {
                          return 'O CPF deve conter 11 caracteres';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        _dataNascimento = valor;
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
                        _celular = valor;
                      },
                      textoDica: 'Digite o seu número de celular',
                      textoRotulo: 'Celular',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu número de celular';
                        }

                        if (valor.length > 11) {
                          return 'O número de celular deve conter 11 caracteres';
                        }

                        return null;
                      },
                    ),
                    Botao(
                      pressionar: () async {
                        if (!_chaveFormulario.currentState!.validate()) {
                          return;
                        }

                        setState(() {
                          loading = true;
                        });

                        try {
                          _chaveFormulario.currentState!.save();

                          final funcionarioModel = FuncionarioModel(
                            nome: _nome,
                            sobrenome: _sobrenome,
                            email: _email,
                            senha: _senha,
                            cpf: _cpf,
                            dataNascimento: _dataNascimento,
                            celular: _celular,
                          );

                          await funcionarioModel.salvar();
                        } catch (error) {
                          exibirMensagem(context, 'Erro', mensagemErro);
                        }

                        // ignore: use_build_context_synchronously
                        exibirMensagem(
                          context,
                          'Sucesso',
                          'Funcionário cadastrado com sucesso',
                        );

                        setState(() {
                          loading = false;
                        });
                      },
                      texto: 'Cadastrar',
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
