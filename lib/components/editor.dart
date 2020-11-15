import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final TextInputType tipoTeclado;

  Editor(
      {this.controlador, this.rotulo, this.dica, this.icone, this.tipoTeclado});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      keyboardType: tipoTeclado,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          icon: icone != null ? Icon(icone) : null),
    );
  }
}
