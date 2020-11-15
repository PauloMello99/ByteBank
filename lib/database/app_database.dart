import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ByteBank/models/contato.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((caminhoDB) {
    final String caminho = join(caminhoDB, 'bytebank.db');
    return openDatabase(caminho, onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'conta INTEGER)');
    }, version: 1);
  });
}

Future<int> salvarContato(Contato contato) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['nome'] = contato.nome;
    contatoMap['conta'] = contato.numeroConta;
    return db.insert('contatos', contatoMap);
  });
}

Future<List<Contato>> listarContatos() {
  return createDatabase().then((db) {
    return db.query('contatos').then((maps) {
      final List<Contato> contatos = List();
      for (Map<String, dynamic> map in maps) {
        final Contato contato =
            Contato(id: map['id'], nome: map['nome'], numeroConta: map['conta']);
        contatos.add(contato);
      }
      return contatos;
    });
  });
}
