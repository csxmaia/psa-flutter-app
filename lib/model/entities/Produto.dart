class Produto {
  int? id;
  int? ean;
  String? nome;
  String? descricao;
  double? quantidadeEstoque;
  double? valorVenda;

  Produto();

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ean = json['ean'];
    nome = json['nome'];
    descricao = json['descricao'];
    quantidadeEstoque = json['quantidade_estoque'];
    valorVenda = json['valor_venda'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['ean'] = ean;
    _data['nome'] = nome;
    _data['descricao'] = descricao;
    _data['quantidade_estoque'] = quantidadeEstoque;
    _data['valor_venda'] = valorVenda;
    return _data;
  }
}
