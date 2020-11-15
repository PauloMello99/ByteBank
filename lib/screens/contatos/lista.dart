import 'package:ByteBank/dao/contato_dao.dart';
import 'package:ByteBank/models/contato.dart';
import 'package:ByteBank/screens/contatos/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Contatos';
const _textCarregando = 'Carregando ...';
const _textoErro = 'Erro inesperado, tente novamente.';

class ListaContatos extends StatelessWidget {

  final ContatoDAO dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _irParaFormulario(context),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future:
            Future.delayed(Duration(seconds: 2)).then((v) => dao.listarContatos()),
        builder: _renderizarLista,
      ),
    );
  }

  Widget _renderizarLista(context, snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        break;
      case ConnectionState.active:
        break;
      case ConnectionState.waiting:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
              Text(_textCarregando),
            ],
          ),
        );
        break;
      case ConnectionState.done:
        final List<Contato> contatos = snapshot.data;
        return ListView.builder(
            itemBuilder: (context, index) {
              final Contato contato = contatos[index];
              return ItemContato(contato);
            },
            itemCount: contatos.length);
        break;
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(_textoErro)],
      ),
    );
  }

  void _irParaFormulario(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormularioContato()));
  }
}

class ItemContato extends StatelessWidget {
  final Contato contato;

  ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(contato.numeroConta.toString(),
            style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
