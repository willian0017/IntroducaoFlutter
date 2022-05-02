enum Sexo {MASCULINO, FEMININO}

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  int? getIdade(){
    if (nascimento == null) {
      return null;
    }
    final hoje = DateTime.now();
    final idade = hoje.difference(nascimento!);
    return idade.inDays ~/ 365;
  }

  @override
  String toString() {
    return "{nome= $nome, cpf= $cpf, nascimento= $nascimento, idade= ${getIdade()},"
        "sexo= $sexo}";
  }
}

  class Programador extends Pessoa{
    double? salario;

    @override
    String toString() {
      return "{nome= $nome, cpf= $cpf, nascimento= $nascimento, idade= $idade,"
          "sexo= $sexo, salario= $salario}";
    }
  }


void mainEntiedades(){
  Pessoa pessoa = Programador();
  pessoa.nome = 'Willian';
  pessoa.nascimento = DateTime(2000,13,10);
  pessoa.sexo = Sexo.MASCULINO;
  // pessoa.salario = 2000.0;
  print(pessoa.toString());
}

