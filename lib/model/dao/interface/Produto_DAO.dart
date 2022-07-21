import 'package:psa_flutter_app/model/entities/Produto.dart';

abstract class ProdutoDAO {
  Future<List<Produto>> findAll();

  Future<Produto> findById(int idProduto);

  Future<Produto> save(Produto produto);

  Future<Produto> update(Produto produto);

  Future<bool> delete(int idProduto);
}
