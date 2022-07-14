import 'package:psa_flutter_app/model/dao/Produto_DAO_impl.dart';
import 'package:psa_flutter_app/model/entities/Produto.dart';

class ProdutoService {
  ProdutoDAOImpl dao = ProdutoDAOImpl();

  Future<List<Produto>> buscarTodos() async {
    List<Produto> produtoList = <Produto>[];

    Produto produto = Produto();
    produto.ean = 1233333;
    produto.nome = "produto1";
    produto.descricao = "produto1";
    produto.quantidadeEstoque = 20;
    produto.valorVenda = 200;

    produtoList.add(produto);

    Produto produto2 = Produto();
    produto2.ean = 1233333;
    produto2.nome = "produto1";
    produto2.descricao = "produto1";
    produto2.quantidadeEstoque = 20;
    produto2.valorVenda = 200;

    produtoList.add(produto2);

    return produtoList;
  }

  Future<Produto> salvar(Produto produto) async {
    Produto produtoSalvo = await dao.save(produto);
    return produtoSalvo;
  }
}
