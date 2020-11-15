import 'package:ByteBank/models/transferencia.dart';
import 'package:ByteBank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: renderizarItem,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => adicionarTransferencia(context),
      ),
    );
  }

  Widget renderizarItem(context, index) {
    final transferencia = widget._transferencias[index];
    return ItemTransferencia(transferencia);
  }

  adicionarTransferencia(BuildContext context) {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => FormularioTransferencia()))
        .then((transferenciaRecebida) {
      if (transferenciaRecebida != null) {
        setState(() => widget._transferencias.add(transferenciaRecebida));
      }
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
