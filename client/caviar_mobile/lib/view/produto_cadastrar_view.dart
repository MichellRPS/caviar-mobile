import 'package:flutter/material.dart';

import '../model/produto_model.dart';
import '../widgets/app_bar_customizada.dart';
import '../widgets/botao_formulario.dart';
import '../widgets/campo_formulario.dart';
import '../widgets/carregamento.dart';
import '../constantes.dart';

class ProdutoCadastrarView extends StatefulWidget {
  static const String rota = '/cadastrar-produto';

  const ProdutoCadastrarView({super.key});

  @override
  State<ProdutoCadastrarView> createState() => _ProdutoCadastrarViewState();
}

class _ProdutoCadastrarViewState extends State<ProdutoCadastrarView> {
  final GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>();
  bool carregando = false;
  ProdutoModel produto = ProdutoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomizada(textoTitulo: 'Cadastrar Produto'),
      backgroundColor: branco,
      body: carregando
          ? const Carregamento()
          : Form(
              key: _chaveFormulario,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // TODO: imagem do produto
                    CampoFormulario(
                      aoSalvar: (valor) {
                        produto.nome = valor;
                      },
                      textoDica: 'Digite o nome do produto',
                      textoRotulo: 'Nome',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o nome do produto';
                        }

                        if (valor.length > 100) {
                          return 'O nome pode conter no máximo 100 caracteres';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        produto.descricao = valor;
                      },
                      textoDica: 'Digite a descrição do produto',
                      textoRotulo: 'Descrição',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite a descrição do produto';
                        }

                        if (valor.length > 100) {
                          return 'A descrição pode conter no máximo 100 caracteres';
                        }

                        return null;
                      },
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        produto.precoUnitario = valor;
                      },
                      textoDica: 'Digite o preço unitário do produto',
                      textoRotulo: 'Preço unitário',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o preço unitário do produto';
                        }

                        if (valor.length > 100) {
                          return 'O preço unitário pode conter no máximo 10 dígitos inteiros e 2 decimais';
                        }

                        return null;
                      },
                    ),
                    // TODO: categoria do produto
                    BotaoFormulario(
                      salvar: () async {
                        if (!_chaveFormulario.currentState!.validate()) {
                          return;
                        }

                        setState(() {
                          carregando = true;
                        });

                        try {
                          _chaveFormulario.currentState!.save();

                          var resposta = await produto.salvar();

                          if (resposta.statusCode == 200) {
                            // ignore: use_build_context_synchronously
                            exibirMensagem(
                              context,
                              'Sucesso',
                              'Produto cadastrado com sucesso',
                            );
                          }
                        } catch (error) {
                          exibirMensagem(context, 'Erro', mensagemErro);
                        }

                        setState(() {
                          carregando = false;
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
