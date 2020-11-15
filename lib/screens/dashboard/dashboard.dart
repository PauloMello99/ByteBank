import 'package:ByteBank/screens/contatos/lista.dart';
import 'package:ByteBank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Dashboard';
const _imgSrc = 'images/bytebank_logo.png';
const _tituloContatos = 'Contatos';
const _tituloTransferencia = 'Transferências';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(_imgSrc),
            Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () => _irParaTransferencias(context),
                child: Container(
                  height: 90,
                  width: 160,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 28,
                        color: Colors.white,
                      ),
                      Text(
                        _tituloTransferencia,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () => _irParaContatos(context),
                child: Container(
                  height: 90,
                  width: 160,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        size: 28,
                        color: Colors.white,
                      ),
                      Text(
                        _tituloContatos,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _irParaTransferencias(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ListaTransferencias()));
  }

  void _irParaContatos(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListaContatos()));
  }
}
