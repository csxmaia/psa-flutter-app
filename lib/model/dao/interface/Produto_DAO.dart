import 'package:psa_flutter_app/model/entities/Produto.dart';

abstract class ProdutoDAO {
  List<Produto> findAll();

  Produto findById(int idProduto);

  Future<Produto> save(Produto produto);

  void delete(int idProduto);
}
