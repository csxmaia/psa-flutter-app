import 'package:psa_flutter_app/model/db_connection.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';
import 'package:sqflite/sqflite.dart';

import 'interface/Produto_DAO.dart';

class ProdutoDAOImpl extends ProdutoDAO {
  // final Future<Database> database = DB().database;

  @override
  void delete(int idProduto) {
    // TODO: implement delete
  }

  @override
  List<Produto> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Produto findById(int idProduto) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<Produto> save(Produto produto) async {
    final Database db = await DB().database;

    var sql =
        "INSERT INTO produto(ean, nome, descricao, quantidade_estoque, valor_venda) VALUES (?, ?, ?, ?, ?)";
    int id = await db.rawInsert(sql, [
      produto.ean,
      produto.nome,
      produto.descricao,
      produto.quantidadeEstoque,
      produto.valorVenda
    ]);

    produto.id = id;

    return produto;
  }
}
