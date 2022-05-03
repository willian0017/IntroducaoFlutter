import 'package:introducao_flutter/model.dart';
import 'dart:math';

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

  double getValorTotal() {
    double total = 0.0;
    for (ItemNF item in itens) {
      total += item.getValorTotal();
    }
    return total;
  }

  calcularTotalDescontos() {
    double desconto = 0.0;
    for (int i = 0; i < itens.length; i++) {
      desconto += itens[i].desconto;
    }
    return desconto;
  }

  calcularTotalAcrescimos() {
    double acrescimo = 0.0;
    for (int i = 0; i > itens.length; i++) {
      acrescimo += itens[i].desconto;
    }
    return acrescimo;
  }

  ItemNF? getProdutoMaisBarato() {
    ItemNF? itemMaisBarato;
    for (ItemNF item in itens) {
      if (itemMaisBarato == null) {
        itemMaisBarato = item;
      } else if (item.getValorTotal() < itemMaisBarato.getValorTotal()) {
        itemMaisBarato = item;
      }
    }
    return itemMaisBarato;
  }

  ItemNF? getProdutoMaisCaro() {
    ItemNF? itemMaisBarato;
    for (ItemNF item in itens) {
      if (itemMaisBarato == null) {
        itemMaisBarato = item;
      } else if (item.getValorTotal() > itemMaisBarato.getValorTotal()) {
        itemMaisBarato = item;
      }
    }
    return itemMaisBarato;
  }

  ItemNF addItem(
      {required String produto,
      required valor,
      double desconto = 0.0,
      double acrescimo = 0.0}) {
    ItemNF item = ItemNF(
        produto: produto,
        valor: valor,
        numSeq: itens.length + 1,
        desconto: desconto,
        acrescimo: acrescimo);
    itens.add(item);
    return item;
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
  nota.addItem(produto: 'Teclado', valor: 200.0, acrescimo: 1500);
  print('Valor total NF = ${nota.getValorTotal()}');
  print('Produto mais barato = ${nota.getProdutoMaisBarato()}');
  print('Produto mais caro = ${nota.getProdutoMaisCaro()}');
}
