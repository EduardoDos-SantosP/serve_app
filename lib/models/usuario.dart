import 'package:serve_app/models/model.dart';

class Usuario extends Model {
  String nome;
  String login;
  String senha;

  Usuario(id, this.nome, this.login, this.senha) : super(id);

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      Usuario(json['_id'], json['nome'], json['login'], json['senha']);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..['nome'] = nome
    ..['login'] = login
    ..['senha'] = senha;
}
