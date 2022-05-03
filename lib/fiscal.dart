import 'dart:io';

import 'package:introducao_flutter/model.dart';

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  Sexo? sexo;

  Pessoa({this.nome, this.cpf, this.nascimento, this.sexo});
}

class NotaFiscal {
  int? numero;
  DateTime? emissao;
  Pessoa? cliente;
  String? enderecoEntrega;
  List<ItemNF> itens = [];

  NotaFiscal({this.numero, this.emissao, this.cliente, this.enderecoEntrega});

  // Future<double> getValorTotal() async {
  //   print('Calculando o valor da NF...');
  //   sleep(const Duration(seconds: 2));
  //   double total = 0.0;
  //   for (ItemNF item in itens) {
  //     total += item.getValorTotal();
  //   }
  //   return total;
  // }

    getValorTotal()  {
    return itens.map((e) => e.getValorTotal()).reduce((a, b) => a + b);
  }

  // calcularTotalDescontos() {
  //   double desconto = 0.0;
  //   for (int i = 0; i < itens.length; i++) {
  //     desconto += itens[i].desconto;
  //   }
  //   return desconto;
  // }

  calcularTotalDescontos() {
    return itens.map((e) => e.desconto).reduce((a, b) => a - b);
  }

  // calcularTotalAcrescimos() {
  //   double acrescimo = 0.0;
  //   for (int i = 0; i > itens.length; i++) {
  //     acrescimo += itens[i].desconto;
  //   }
  //   return acrescimo;
  // }

  calcularTotalAcrescimos() {
    return itens.map((e) => e.acrescimo).reduce((a, b) => a + b);
  }

  // ItemNF? getProdutoMaisBarato() {
  //   ItemNF? itemMaisBarato;
  //   for (ItemNF item in itens) {
  //     if (itemMaisBarato == null) {
  //       itemMaisBarato = item;
  //     } else if (item.getValorTotal() < itemMaisBarato.getValorTotal()) {
  //       itemMaisBarato = item;
  //     }
  //   }
  //   return itemMaisBarato;
  // }

  getProdutoMaisBarato() {
    return itens.reduce((a, b) => a.getValorTotal() < b.getValorTotal() ? a : b);
  }

  // ItemNF? getProdutoMaisCaro() {
  //   ItemNF? itemMaisBarato;
  //   for (ItemNF item in itens) {
  //     if (itemMaisBarato == null) {
  //       itemMaisBarato = item;
  //     } else if (item.getValorTotal() > itemMaisBarato.getValorTotal()) {
  //       itemMaisBarato = item;
  //     }
  //   }
  //   return itemMaisBarato;
  // }

  getProdutoMaisCaro() {
    return itens.reduce((a, b) => a.getValorTotal() > b.getValorTotal() ? a : b);
  }

  bool possuiDesconto(){
    return itens.any((e) => e.desconto > 0);
  }

  List<ItemNF> itensComDesconto(){
    return itens.where((e) => e.desconto > 0).toList();
  }

  ItemNF addItem(
      {required String produto,
      required valor,
      double desconto = 0.0,
      double acrescimo = 0.0}) {
    if(valor == 0.0){
      throw Exception('Valor não pode ser zero');
    }
    if (produto == ''){

      throw Exception('Produto precisa ser informado.');
    }
    ItemNF item = ItemNF(
        produto: produto,
        valor: valor,
        numSeq: itens.length + 1,
        desconto: desconto,
        acrescimo: acrescimo);
    itens.add(item);
    return item;
  }

  String getStrItens(){
      return itens.map((i) => "${i.numSeq}: ${i.produto}").join(", ");
  }
}

class ItemNF {
  int numSeq;
  String produto;
  double valor = 0;
  double desconto = 0;
  double acrescimo = 0;

  ItemNF(
      {required this.numSeq,
      required this.produto,
      required this.valor,
      this.desconto = 0.0,
      this.acrescimo = 0.0});

  double getValorTotal() => valor + acrescimo - desconto;

  @override
  String toString() {
    return '{numSeq=$numSeq, produto=$produto, valor=$valor,'
        'desconto=$desconto, acrescimo=$acrescimo, valorTotal=${getValorTotal()}}';
  }
}

void mainNotaFiscal() {
  final pessoa = Pessoa(nome: 'Willian');
  final nota = NotaFiscal(
      cliente: pessoa,
      emissao: DateTime(2022, 5, 3),
      enderecoEntrega: 'Rua 7 de Setembro',
      numero: 1202);
  nota.addItem(produto: 'Notebook', valor: 1000.0, acrescimo: 100);
  nota.addItem(produto: 'Teclado', valor: 200.0, desconto: 1500);
  // double valorTotal = await nota.getValorTotal();
  // print('Produto mais barato = ${nota.getProdutoMaisBarato()}');
  // print('Produto mais caro = ${nota.getProdutoMaisCaro()}');
  //
  // nota.getValorTotal().then((value){
  //   double valorTotal = value;
  //   print('Valor total da NF = ${valorTotal}');
  // });
  print('Possui desconto = ${nota.itensComDesconto()}');
}
