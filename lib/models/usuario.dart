import 'dart:convert';

import 'package:serve_app/models/model.dart';

class Usuario extends Model {
  String nome;
  String login;
  String senha;

  Usuario(String id, this.nome, this.login, this.senha) : super(id);

  Usuario.toLogin(String login, String senha) : this('', '', login, senha);

  factory Usuario.fromJsonObj(Map<String, dynamic> json) =>
      Usuario(json['_id'], json['nome'], json['login'], json['senha']);

  factory Usuario.fromJson(String json) =>
      Usuario.fromJsonObj(jsonDecode(json));

  @override
  Map<String, dynamic> toJsonObj() => super.toJsonObj()
    ..['nome'] = nome
    ..['login'] = login
    ..['senha'] = senha;
}
