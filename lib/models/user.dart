import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String name;
  String login;
  String password;
  String tipo;
  String token;

  User({
    required this.id,
    required this.name,
    required this.login,
    required this.password,
    required this.tipo,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["nome"],
        login: json["login"],
        password: json["senha"],
        tipo: json["tipo"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": name,
        "login": login,
        "senha": password,
        "tipo": tipo,
        "token": token,
      };
}
