import 'package:flutter/material.dart';

class CampoFormulario extends StatefulWidget {
  final void Function(String)? aoDigitarCaractere;
  final void Function(String?)? aoSalvar;
  final bool data;
  final bool ocultarTexto;
  final String textoDica;
  final String textoRotulo;
  final String? Function(String?)? validar;

  const CampoFormulario({
    this.aoDigitarCaractere,
    this.aoSalvar,
    this.data = false,
    super.key,
    this.ocultarTexto = false,
    required this.textoDica,
    required this.textoRotulo,
    required this.validar,
  });

  @override
  State<CampoFormulario> createState() => _CampoFormularioState();
}

class _CampoFormularioState extends State<CampoFormulario> {
  final TextEditingController _controlador = TextEditingController();
  bool _ocultarTexto = true;

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? selecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (selecionada != null) {
      setState(() {
        _controlador.text = selecionada.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.textoRotulo,
            style: const TextStyle(
              color: Color(0xFF19191A),
              fontSize: 16,
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              TextFormField(
                controller: _controlador,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: const TextStyle(
                    color: Color(0xFFFD3B11),
                    fontSize: 14,
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xFF19191A),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: widget.textoDica,
                  fillColor: const Color(0xFFE4E4E4),
                  filled: true,
                  suffixIcon: widget.ocultarTexto
                      ? IconButton(
                          icon: Icon(
                            _ocultarTexto
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF19191A),
                          ),
                          onPressed: () {
                            setState(() {
                              _ocultarTexto = !_ocultarTexto;
                            });
                          },
                        )
                      : widget.data
                          ? IconButton(
                              icon: const Icon(
                                Icons.date_range,
                                color: Color(0xFF19191A),
                              ),
                              onPressed: () {
                                _selecionarData(context);
                              },
                            )
                          : null,
                ),
                obscureText: _ocultarTexto && widget.ocultarTexto,
                onChanged: widget.aoDigitarCaractere,
                onSaved: widget.aoSalvar,
                readOnly: widget.data,
                validator: widget.validar,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
