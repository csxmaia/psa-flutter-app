import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:psa_flutter_app/controller/produto_controller.dart';
import 'package:psa_flutter_app/controller/produto_service.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';

class ProdutoList extends StatefulWidget {
  const ProdutoList({Key? key}) : super(key: key);

  @override
  State<ProdutoList> createState() => _ProdutoListState();
}

ProdutoController controller = ProdutoController();

void excluirProduto(int id) {
  Future<bool> deletado = controller.deletar(id);
}

class _ProdutoListState extends State<ProdutoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Produtos"), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/produto/create'),
        )
      ]),
      body: FutureBuilder(
          future: controller.buscar(),
          builder: (context, AsyncSnapshot<List<Produto>> dados) {
            if (!dados.hasData) return const CircularProgressIndicator();
            var produtos = dados.data!;
            return ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, contador) {
                  var produto = produtos[contador];
                  return ListTile(
                      title: Text(produto.nome.toString()),
                      subtitle: Text(produto.ean.toString()),
                      onTap: () => (Navigator.pushNamed(
                          context, "/produto/view", arguments: produto)),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => excluirProduto(produto.id!)));
                });
          }),
    );
  }
}
