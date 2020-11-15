import 'package:ByteBank/database/app_database.dart';
import 'package:ByteBank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDAO {

  static const String tabelaSQL = 'CREATE TABLE contatos('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'conta INTEGER)';

  static const String _tabelaNome = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _conta = 'conta';

  Future<int> salvarContato(Contato contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_nome] = contato.nome;
    contatoMap[_conta] = contato.numeroConta;

    return db.insert(_tabelaNome, contatoMap);
  }

  Future<List<Contato>> listarContatos() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tabelaNome);
    final List<Contato> contatos = List();

    for (Map<String, dynamic> linha in resultado) {
      final Contato contato = Contato(
          id: linha[_id], nome: linha[_nome], numeroConta: linha[_conta]);
      contatos.add(contato);
    }

    return contatos;
  }

}