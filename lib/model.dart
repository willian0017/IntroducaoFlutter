enum Sexo {MASCULINO, FEMININO}

class Pessoa{
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;
  double? salario;
  bool? programador;

  @override
  String toString() {
    return "{nome= $nome, cpf= $cpf, nascimento= $nascimento, idade= $idade,"
        "sexo= $sexo, salario= $salario, programador= $programador}";
  }
}

void mainEntiedades(){
  Pessoa pessoa = Pessoa();
  pessoa.nome = 'Willian';
  pessoa.nascimento = DateTime(2000,13,10);
  pessoa.idade = 21;
  pessoa.sexo = Sexo.MASCULINO;
  pessoa.salario = 2000.0;
  pessoa.programador = true;

  print(pessoa.toString());
}

