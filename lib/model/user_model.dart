class User {
  int? id;
  int? idade;
  String? nome;
  String? endereco;
  String? telefone;
  String? email;
  String? senha;

  User(
      {this.id,
      this.idade,
      this.nome,
      this.endereco,
      this.telefone,
      this.email,
      this.senha,
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idade = json['idade'];
    nome = json['nome'];
    endereco = json['endereco'];
    telefone = json['telefone'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idade'] = this.idade;
    data['nome'] = this.nome;
    data['endereco'] = this.endereco;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}