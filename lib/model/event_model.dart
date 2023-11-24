class Event {
  int? id;
  String? nome;
  String? descricao;
  String? imagem;
  int? clienteId;

  Event({this.id, this.nome, this.descricao, this.imagem, this.clienteId});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    imagem = json['imagem'];
    clienteId = json['cliente_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['cliente_id'] = this.clienteId;
    return data;
  }
}