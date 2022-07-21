import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:psa_flutter_app/controller/produto_controller.dart';
import 'package:psa_flutter_app/controller/produto_service.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';

class ProdutoCreate extends StatelessWidget {
  ProdutoCreate({Key? key}) : super(key: key);

  ProdutoController controller = ProdutoController();

  Produto produto = Produto();

  Widget field(
      {required String label,
      TextInputType inputType = TextInputType.text,
      ValueChanged<String>? onChanged}) {
    return TextField(
        decoration: InputDecoration(labelText: label),
        keyboardType: inputType,
        onChanged: onChanged);
  }

  salvarProduto(BuildContext context, Produto produto) {
    controller.salvar(produto);
    Navigator.pushNamed(context, '/produtos');
  }

  validateFormFields(Produto produto) {
    produtoCheckEmpty(produto);
    isInt(produto.ean);
  }

  produtoCheckEmpty(Produto produto) {
    checkIsEmpty("Ean", produto.ean);
    checkIsEmpty("Nome", produto.nome);
    checkIsEmpty("Descricao", produto.descricao);
    checkIsEmpty("Quantidade Estoque", produto.quantidadeEstoque);
    checkIsEmpty("Valor Venda", produto.valorVenda);
  }

  checkIsEmpty(String campo, dynamic value) {
    if (isEmpty(value)) {
      throw Exception("O campo $campo está vazio!");
    }
  }

  isEmpty(dynamic value) {
    String stringValue = value.toString();
    if (stringValue.trim() == "") {
      return true;
    }
  }

  void isInt(dynamic value) {
    if (value is! int) {
      throw Exception("Valor não é um Int");
    }
  }

  isDouble(dynamic value) {
    if (value is! double) {
      throw Exception("Valor não é um Double");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produto')),
      body: Container(
          child: Form(
              child: Column(
        children: [
          field(
              label: "Ean",
              inputType: TextInputType.number,
              onChanged: (String val) {
                produto.ean = int.parse(val);
              }),
          field(
              label: "Nome",
              inputType: TextInputType.text,
              onChanged: (String val) {
                produto.nome = val;
              }),
          field(
              label: "Descrição",
              inputType: TextInputType.text,
              onChanged: (String val) {
                produto.descricao = val;
              }),
          field(
              label: "Quantidade Estoque",
              inputType: TextInputType.number,
              onChanged: (String val) {
                produto.quantidadeEstoque = double.parse(val);
              }),
          field(
              label: "Valor Venda",
              inputType: TextInputType.text,
              onChanged: (String val) {
                produto.valorVenda = double.parse(val);
              }),
          ElevatedButton(
            onPressed: () => salvarProduto(context, produto),
            child: const Text("Salvar"),
          )
        ],
      ))),
    );
  }
}
