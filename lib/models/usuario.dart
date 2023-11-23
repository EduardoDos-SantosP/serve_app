import 'package:serve_app/models/model.dart';

class Usuario extends Model {
  String? _nome;
  String? _login;
  String? _senha;

  get nome => _nome!;

  set nome(v) => _nome = v;

  get login => _login!;

  set login(v) => _login = v;

  get senha => _senha!;

  set senha(v) => _senha = v;

  Usuario.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
  }

  @override
  Map<String, dynamic> toJson() {
    var json = super.toJson();
    json.addAll({'nome': nome, 'login': login, 'senha': senha});
    return json;
  }
}
