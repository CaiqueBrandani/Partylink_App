import 'package:partylink/model/pedidos_model.dart';

class Event {
  int? id;
  String? nome;
  String? descricao;
  String? data;
  String? status;
  String? imagem;
  int? clienteId;
  List<Pedidos>? pedidos;

  Event(
      {this.id,
      this.nome,
      this.descricao,
      this.data,
      this.status,
      this.imagem,
      this.clienteId,
      this.pedidos});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    data = json['data'];
    status = json['status'];
    imagem = json['imagem'];
    clienteId = json['cliente_id'];
    if (json['pedidos'] != null) {
      pedidos = <Pedidos>[];
      json['pedidos'].forEach((v) {
        pedidos!.add(new Pedidos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['data'] = this.data;
    data['status'] = this.status;
    data['imagem'] = this.imagem;
    data['cliente_id'] = this.clienteId;
    if (this.pedidos != null) {
      data['pedidos'] = this.pedidos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}