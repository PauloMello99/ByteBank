import 'package:ByteBank/components/editor.dart';
import 'package:ByteBank/dao/contato_dao.dart';
import 'package:ByteBank/models/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Novo Contato';
const _rotuloNome = 'Nome completo';
const _rotuloConta = 'Número da conta';
const _dicaNome = 'Fulano de Tal';
const _dicaConta = '0000000';
const _botaoCriar = 'Criar contato';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorConta = TextEditingController();
  final ContatoDAO dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Editor(
              dica: _dicaNome,
              rotulo: _rotuloNome,
              controlador: _controladorNome,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Editor(
                  dica: _dicaConta,
                  rotulo: _rotuloConta,
                  controlador: _controladorConta),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: _adicionarContato,
                  child: Text(_botaoCriar),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _adicionarContato() {
    final String nome = _controladorNome.text;
    final int conta = int.tryParse(_controladorConta.text);

    if (nome != null && conta != null) {
      final Contato contato = Contato(id: 0, nome: nome, numeroConta: conta);
      dao.salvarContato(contato).then((id) => Navigator.pop(context));
    }
  }
}
