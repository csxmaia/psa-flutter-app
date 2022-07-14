import 'package:flutter/material.dart';
import 'package:psa_flutter_app/controller/produto_service.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';

class ProdutoCreate extends StatelessWidget {
  ProdutoCreate({Key? key}) : super(key: key);

  ProdutoService produtoService = ProdutoService();

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

  salvarProduto(Produto produto) {
    //TODO validações
    produtoService.salvar(produto);
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
            onPressed: () => salvarProduto(produto),
            child: const Text("Salvar"),
          )
        ],
      ))),
    );
  }
}
