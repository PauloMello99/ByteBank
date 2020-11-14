import 'package:flutter/material.dart';
import 'package:ByteBank/components/editor.dart';
import 'package:ByteBank/models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '000';
const _rotuloValor = 'Valor';
const _dicaValor = '0.00';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloNumeroConta,
                dica: _dicaNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => criarTransferencia(context))
          ],
        ),
      ),
    );
  }

  void criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}