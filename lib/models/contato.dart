class Contato {
  final String nome;
  final int numeroConta;
  final int id;

  Contato({this.id, this.nome, this.numeroConta});

  @override
  String toString() {
    return 'Contato{nome: $nome, numeroConta: $numeroConta, id: $id}';
  }
}
