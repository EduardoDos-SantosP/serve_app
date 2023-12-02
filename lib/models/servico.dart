import 'dart:convert';

import 'model.dart';

class Servico extends Model {
  String nome;
  double preco;

  Servico(String id, this.nome, this.preco) : super(id);

  factory Servico.fromJsonObj(Map<String, dynamic> json) =>
      Servico(json['_id'], json['nome'], json['preco'] / 1.0);

  factory Servico.fromJson(String json) =>
      Servico.fromJsonObj(jsonDecode(json));

  @override
  Map<String, dynamic> toJsonObj() => super.toJsonObj()
    ..['nome'] = nome
    ..['preco'] = preco;
}
