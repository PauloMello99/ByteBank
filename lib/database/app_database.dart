import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:ByteBank/dao/contato_dao.dart';

Future<Database> getDatabase() async {
  final String caminhoDB = await getDatabasesPath();
  final String caminho = join(caminhoDB, 'bytebank.db');

  FutureOr<void> onCreate(db, version) {
    db.execute(ContatoDAO.tabelaSQL);
  }

  return openDatabase(caminho, onCreate: onCreate, version: 1);
}
