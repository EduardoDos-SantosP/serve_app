import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  //int id;
  String name;
  String email;
  String password;
  String tipo;

  User({
    //required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.tipo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        //id: json["id"],
        name: json["nome"],
        email: json["login"],
        password: json["senha"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "nome": name,
        "login": email,
        "senha": password,
        "tipo": tipo,
      };
}
