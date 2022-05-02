enum Sexo {MASCULINO, FEMININO}

Sexo? strToSexo(String? str){
  if(str == null){
    return null;
  }
  switch(str) {
    case 'MASCULINO':
    case 'M':
      return Sexo.MASCULINO;
    case 'FEMININO':
    case 'F':
      return Sexo.FEMININO;
  }
}

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa(this.nome, this.cpf, this.nascimento, this.sexo);

  Pessoa.fromMap(Map<String, String> map){
    nome = map ['nome'];
    cpf = map ['cpf'];
    nascimento = DateTime.tryParse(map['nascimento'] ?? '2000-01-01');
    nascimento = DateTime.parse(map['nascimento'] ?? '2000-01-01');
    sexo = strToSexo(map['sexo']);
  }

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
    return "{nome= $nome, cpf= $cpf, nascimento= $nascimento, idade= ${getIdade()}, "
        "sexo= $sexo}";
  }
}

  class Programador extends Pessoa{
    double? salario;

    Programador(String? nome, String? cpf, DateTime? nascimento, Sexo? sexo,
    this.salario) : super(nome, cpf, nascimento, sexo);

    Programador.fromMap(Map<String, String> map) : super.fromMap(map){
      salario = double.tryParse(map['salario']??"0.0");
    }

    @override
    String toString() {
      return "{nome= $nome, cpf= $cpf, nascimento= $nascimento, idade= ${getIdade()}"
          "sexo= $sexo, salario= $salario}";
    }
  }


void mainEntiedades(){
  final map = {
    'nome': 'Willian',
    'nascimento': '2000-10-13',
    'sexo': 'M',
    'salario': '2000.0'
  };
  Pessoa pessoa = Programador.fromMap(map);
  // Pessoa pessoa = Programador();
  // pessoa.nome = 'Willian';
  // pessoa.nascimento = DateTime(2000,13,10);
  // pessoa.sexo = Sexo.MASCULINO;
  // // pessoa.salario = 2000.0;
  print(pessoa.toString());
}

