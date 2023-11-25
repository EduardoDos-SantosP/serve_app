import 'model.dart';

class Servico extends Model {
  String nome;
  double preco;

  Servico(String id, this.nome, this.preco) : super(id);

  factory Servico.fromJson(Map<String, dynamic> json) =>
      Servico(json['_id'], json['nome'], json['preco'] / 1.0);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..['nome'] = nome
    ..['preco'] = preco;
}
