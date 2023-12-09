import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
        json['tipo'],
      );

  @override
  String get resource => 'usuario';

  Future<String> login(Usuario usuario) async {
    var response = await post(
      getUri(resource: 'login'),
      body: usuario.toJson(),
      headers: baseHeaders,
    );
    final decoded = jsonDecode(response.body);
    var token = decoded['token'];

    print(usuario.toJson());
    print(response.statusCode);
    print(decoded);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    validateResponse(decoded);

    print(token);
    if (response.statusCode == 200) {
      return decoded['token'] as String;
    } else {
      throw Exception("Falha na comunicação com o servidor");
    }
  }
}
