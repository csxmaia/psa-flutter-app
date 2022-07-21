import 'package:psa_flutter_app/model/db_connection.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';
import 'package:sqflite/sqflite.dart';

import 'interface/Produto_DAO.dart';

class ProdutoDAOImpl extends ProdutoDAO {
  @override
  Future<bool> delete(int idProduto) async {
    final Database db = await DB().database;
    int count =
        await db.delete('produto', where: 'id = ?', whereArgs: [idProduto]);
    return count != 0;
  }

  @override
  Future<List<Produto>> findAll() async {
    final Database db = await DB().database;
    var sql = "SELECT * FROM produto";
    List<Map<String, Object?>> data = await db.rawQuery(sql);
    List<Produto> produtos =
        List<Produto>.from(data.map((produto) => Produto.fromJson(produto)));

    return produtos;
  }

  @override
  Future<Produto> findById(int idProduto) async {
    final Database db = await DB().database;
    var sql = "SELECT * FROM produto WHERE id = ?";
    var data = await db.rawQuery(sql, [idProduto]);
    Produto produto = Produto.fromJson(data[0]);
    return produto;
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

  @override
  Future<Produto> update(Produto produto) async {
    final Database db = await DB().database;

    var sql =
        "UPDATE produto SET ean = ?, nome = ?, descricao = ?, quantidade_estoque = ?, valor_venda = ? WHERE id = ?";
    int id = await db.rawInsert(sql, [
      produto.ean,
      produto.nome,
      produto.descricao,
      produto.quantidadeEstoque,
      produto.valorVenda,
      produto.id
    ]);

    return produto;
  }

  Future<Produto> findByEan(int ean) async {
    final Database db = await DB().database;
    List<Map<String, Object?>> datas = await db.rawQuery("SELECT * FROM produto WHERE ean = ?", [ean]);
    Map<String, Object?> data = datas.first;
    Produto produto = Produto.fromJson(data);
    return produto;
  }
}
