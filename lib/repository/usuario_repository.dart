import 'dart:convert';

import 'package:http/http.dart';
import 'package:serve_app/models/usuario.dart';
import 'package:serve_app/repository/repository.dart';

class UsuarioRepository extends Repository<Usuario> {
  @override
  Usuario getModel(Map<String, dynamic> json) => Usuario(
        json['_id'],
        json['nome'],
        json['login'],
        json['senha'],
      );

  @override
  String get resource => 'usuario';

  Future<String> login(Usuario usuario) async {
    var response = await post(
      getUri(resource: 'login'),
      body: usuario.toJson(),
      headers: baseHeaders,
    );
    var decoded = jsonDecode(response.body);
    validateResponse(decoded);
    return decoded['token'] as String;
  }
}
