import 'package:psa_flutter_app/model/dao/Produto_DAO_impl.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';

class ProdutoService {
  ProdutoDAOImpl dao = ProdutoDAOImpl();

  Future<List<Produto>> buscarTodos() async {
    Future<List<Produto>> produtos = dao.findAll();
    return produtos;
  }

  Future<Produto> criar(Produto produto) async {
    _validarExistenciaPorEan(produto.ean!);
    Produto produtoSalvo = await dao.save(produto);
    return produtoSalvo;
  }

  Future<Produto> alterar(Produto produto) async {
    _validarExistenciaPorEan(produto.ean!);
    Produto produtoSalvo = await dao.update(produto);
    return produtoSalvo;
  }

  Future<bool> deletar(int id) async {
    bool deletado = await dao.delete(id);
    return deletado;
  }

  Future<bool> _validarExistenciaPorEan(int ean) async {
    Produto produto = await dao.findByEan(ean);
    if (produto.id == null) {
      return true;
    }
    throw Exception("Já existe um produto com o codigo EAN informado!");
  }
}
