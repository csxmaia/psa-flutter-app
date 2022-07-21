import 'package:psa_flutter_app/model/entities/Produto.dart';
import 'package:psa_flutter_app/controller/produto_service.dart';

class ProdutoController {
  var produtoService = ProdutoService();

  Future<List<Produto>> buscar() {
    return produtoService.buscarTodos();
  }

  Future<Produto> salvar(Produto produto) {
    if (produto.id == null) {
      return produtoService.criar(produto);
    } else {
      return produtoService.alterar(produto);
    }
  }

  Future<bool> deletar(int id) {
    return produtoService.deletar(id);
  }
}
