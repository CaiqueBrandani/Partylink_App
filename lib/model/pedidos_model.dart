class Pedidos {
  int? id;
  String? quantidade;
  int? produtoId;
  int? fornecedorId;
  int? clienteId;

  Pedidos(
      {this.id,
      this.quantidade,
      this.produtoId,
      this.fornecedorId,
      this.clienteId});

  Pedidos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantidade = json['quantidade'];
    produtoId = json['produto_id'];
    fornecedorId = json['fornecedor_id'];
    clienteId = json['cliente_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantidade'] = this.quantidade;
    data['produto_id'] = this.produtoId;
    data['fornecedor_id'] = this.fornecedorId;
    data['cliente_id'] = this.clienteId;
    return data;
  }
}