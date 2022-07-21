import 'package:flutter/material.dart';
import 'package:psa_flutter_app/controller/produto_controller.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';

class ProdutoView extends StatelessWidget {
  ProdutoView({Key? key}) : super(key: key);

  ProdutoController controller = ProdutoController();

  Widget field(
      {required String label,
      initialValue = "",
      TextInputType inputType = TextInputType.text,
      ValueChanged<String>? onChanged}) {
    return TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: inputType,
        initialValue: initialValue!.toString(),
        onChanged: onChanged);
  }

  salvarProduto(BuildContext context, Produto produto) {
    controller.salvar(produto);
    Navigator.pushNamed(context, '/produtos');
  }

  @override
  Widget build(BuildContext context) {
    final produto = ModalRoute.of(context)!.settings.arguments as Produto;

    return Scaffold(
        appBar: AppBar(title: const Text("Lista de Produtos"), actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => {},
          )
        ]),
        body: Container(
            child: Form(
                child: Column(
          children: [
            field(
                label: "Ean",
                initialValue: produto.ean,
                inputType: TextInputType.number,
                onChanged: (String val) {
                  produto.ean = int.parse(val);
                }),
            field(
                label: "Nome",
                initialValue: produto.nome,
                inputType: TextInputType.text,
                onChanged: (String val) {
                  produto.nome = val;
                }),
            field(
                label: "Descrição",
                initialValue: produto.descricao,
                inputType: TextInputType.text,
                onChanged: (String val) {
                  produto.descricao = val;
                }),
            field(
                label: "Quantidade Estoque",
                initialValue: produto.quantidadeEstoque,
                inputType: TextInputType.number,
                onChanged: (String val) {
                  produto.quantidadeEstoque = double.parse(val);
                }),
            field(
                label: "Valor Venda",
                initialValue: produto.valorVenda,
                inputType: TextInputType.text,
                onChanged: (String val) {
                  produto.valorVenda = double.parse(val);
                }),
            ElevatedButton(
              onPressed: () => salvarProduto(context, produto),
              child: const Text("Salvar"),
            )
          ],
        ))));
  }
}
