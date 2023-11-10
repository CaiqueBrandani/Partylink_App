class Product {
  int? id;
  String? nome;
  String? valor;
  String? descricao;
  int? categoriaId;
  int? medidaId;
  int? fornecedorId;
  int? tipos;

  Product(
      {this.id,
      this.nome,
      this.valor,
      this.descricao,
      this.categoriaId,
      this.medidaId,
      this.fornecedorId,
      this.tipos});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    valor = json['valor'];
    descricao = json['descricao'];
    categoriaId = json['categoriaId'];
    medidaId = json['medidaId'];
    fornecedorId = json['fornecedorId'];
    tipos = json['tipos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['valor'] = this.valor;
    data['descricao'] = this.descricao;
    data['categoriaId'] = this.categoriaId;
    data['medidaId'] = this.medidaId;
    data['fornecedorId'] = this.fornecedorId;
    data['tipos'] = this.tipos;
    return data;
  }
}