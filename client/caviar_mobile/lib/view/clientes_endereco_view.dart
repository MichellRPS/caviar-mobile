// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../model/cidades_model.dart';
import '../model/enderecos_clientes_model.dart';
import '../widgets/campo_formulario.dart';
import '../widgets/botao.dart';
import '../widgets/layout.dart';
import '../constantes.dart';

class ClientesEnderecoView extends StatefulWidget {
  static const String rota = '/clientes/endereco';

  const ClientesEnderecoView({super.key});

  @override
  State<ClientesEnderecoView> createState() => _ClientesEnderecoViewState();
}

class _ClientesEnderecoViewState extends State<ClientesEnderecoView> {
  final GlobalKey<FormState> chaveFormulario = GlobalKey<FormState>();
  List<CidadesModel>? cidades;
  EnderecosClientesModel enderecosClientesModel = EnderecosClientesModel();
  bool loading = true;
  Map<String, dynamic>? usuario;

  @override
  void didChangeDependencies() async {
    var cidades = await CidadesModel.ler();
    usuario =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (usuario != null) {
      var enderecosClientesModel = await EnderecosClientesModel.buscar(
        usuario?['id'],
      );

      if (enderecosClientesModel != null) {
        this.enderecosClientesModel = enderecosClientesModel;
      }
    }

    setState(() {
      this.cidades = cidades;
      loading = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      carregando: loading,
      conteudo: cidades == null
          ? const Center(
              child: Text('Erro'),
            )
          : Form(
              key: chaveFormulario,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CampoFormulario(
                      aoSalvar: (valor) {
                        enderecosClientesModel.cep = valor;
                      },
                      textoDica: 'Digite o seu CEP',
                      textoRotulo: 'CEP',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu CEP';
                        }

                        if (!RegExp(r'^[0-9]+$').hasMatch(valor)) {
                          return 'O CEP deve conter apenas dígitos';
                        }

                        if (valor.length != 8) {
                          return 'O CEP deve conter 8 dígitos';
                        }

                        return null;
                      },
                      valorInicial: enderecosClientesModel.cep,
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        enderecosClientesModel.endereco = valor;
                      },
                      textoDica: 'Digite o seu endereço',
                      textoRotulo: 'Endereço',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu endereço';
                        }

                        if (valor.length > 100) {
                          return 'O endereço pode conter no máximo 100 caracteres';
                        }

                        return null;
                      },
                      valorInicial: enderecosClientesModel.endereco,
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        enderecosClientesModel.numero = valor;
                      },
                      textoDica: 'Digite o número do seu endereço',
                      textoRotulo: 'Número',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o número do seu endereço';
                        }

                        if (!RegExp(r'^[0-9]+$').hasMatch(valor)) {
                          return 'O número deve conter apenas dígitos';
                        }

                        if (valor.length > 4) {
                          return 'O número pode conter no máximo 4 dígitos';
                        }

                        return null;
                      },
                      valorInicial: enderecosClientesModel.numero,
                    ),
                    CampoFormulario(
                      aoSalvar: (valor) {
                        enderecosClientesModel.bairro = valor;
                      },
                      textoDica: 'Digite o seu bairro',
                      textoRotulo: 'Bairro',
                      validar: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Digite o seu bairro';
                        }

                        if (valor.length > 100) {
                          return 'O bairro pode conter no máximo 100 caracteres';
                        }

                        return null;
                      },
                      valorInicial: enderecosClientesModel.bairro,
                    ),
                    DropdownFormulario(
                      aoSalvar: (valor) {
                        CidadesModel cidade = valor as CidadesModel;

                        enderecosClientesModel.id_cidade = cidade.id;
                      },
                      construirItens: () {
                        List<DropdownMenuItem> itens = [];

                        for (var cidade in cidades!) {
                          itens.add(
                            DropdownMenuItem(
                              value: cidade,
                              child: Text(
                                cidade.nome!,
                                style: estiloFonteTexto,
                              ),
                            ),
                          );
                        }

                        return itens;
                      },
                      dica: 'Selecione a sua cidade',
                      titulo: 'Cidade',
                      valorInicial: enderecosClientesModel.id_cidade == null
                          ? null
                          : cidades!.firstWhere(
                              (cidade) =>
                                  cidade.id == enderecosClientesModel.id_cidade,
                            ),
                    ),
                    Botao(
                      pressionar: () async {
                        if (!chaveFormulario.currentState!.validate()) {
                          return;
                        }

                        setState(() {
                          loading = true;
                        });

                        try {
                          chaveFormulario.currentState!.save();

                          if (enderecosClientesModel.id_cliente == null) {
                            enderecosClientesModel.id_cliente = usuario!['id'];
                            enderecosClientesModel.nome = 'Meu Endereço';

                            if (await enderecosClientesModel.salvar()) {
                              exibirMensagem(
                                context,
                                'Sucesso',
                                'Endereço cadastrado com sucesso',
                              );
                            }

                            setState(() {
                              loading = false;
                            });

                            return;
                          }

                          if (await enderecosClientesModel.atualizar()) {
                            exibirMensagem(
                              context,
                              'Sucesso',
                              'Endereço atualizado com sucesso',
                            );

                            setState(() {
                              loading = false;
                            });

                            return;
                          }

                          exibirMensagem(context, 'Erro', 'Erro ao salvar.');
                        } catch (error) {
                          exibirMensagem(context, 'Erro', mensagemErro);
                        }

                        setState(() {
                          loading = false;
                        });
                      },
                      texto: enderecosClientesModel.id_cliente == null
                          ? 'Cadastrar Endereço'
                          : 'Atualizar Endereço',
                    ),
                  ],
                ),
              ),
            ),
      titulo: 'Meu Endereço',
      usuario: usuario,
    );
  }
}
