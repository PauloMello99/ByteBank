import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ByteBank/models/contato.dart';

Future<Database> getDatabase() async {
  final String caminhoDB = await getDatabasesPath();
  final String caminho = join(caminhoDB, 'bytebank.db');

  FutureOr<void> onCreate(db, version) {
    db.execute('CREATE TABLE contatos('
        'id INTEGER PRIMARY KEY, '
        'nome TEXT, '
        'conta INTEGER)');
  }

  return openDatabase(caminho, onCreate: onCreate, version: 1);

  // return getDatabasesPath().then((caminhoDB) {
  //   final String caminho = join(caminhoDB, 'bytebank.db');
  //   return openDatabase(caminho, onCreate: (db, version) {
  //     db.execute('CREATE TABLE contatos('
  //         'id INTEGER PRIMARY KEY, '
  //         'nome TEXT, '
  //         'conta INTEGER)');
  //   }, version: 1);
  // });
}

Future<int> salvarContato(Contato contato) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();
  contatoMap['nome'] = contato.nome;
  contatoMap['conta'] = contato.numeroConta;

  return db.insert('contatos', contatoMap);

  // return getDatabase().then((db) {
  //   final Map<String, dynamic> contatoMap = Map();
  //   contatoMap['nome'] = contato.nome;
  //   contatoMap['conta'] = contato.numeroConta;
  //   return db.insert('contatos', contatoMap);
  // });
}

Future<List<Contato>> listarContatos() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> resultado = await db.query('contatos');
  final List<Contato> contatos = List();

  for (Map<String, dynamic> linha in resultado) {
    final Contato contato = Contato(
        id: linha['id'], nome: linha['nome'], numeroConta: linha['conta']);
    contatos.add(contato);
  }

  return contatos;

  // return getDatabase().then((db) {
  //   return db.query('contatos').then((maps) {
  //     final List<Contato> contatos = List();
  //     for (Map<String, dynamic> map in maps) {
  //       final Contato contato = Contato(
  //           id: map['id'], nome: map['nome'], numeroConta: map['conta']);
  //       contatos.add(contato);
  //     }
  //     return contatos;
  //   });
  // });
}
