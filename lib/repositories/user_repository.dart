import 'dart:convert';
import 'package:serve_app/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User?> newUser(User user) async {
    final token = "ajksjdflkajsdf lkjaksdfj lajdsfklja sdkfj askdfj kas";
    final Uri url = Uri.parse("http://192.168.0.10:8000/usuario");

    final response = await http.post(
      url,
      headers: {"Authorization": "Bearer $token"},
      body: userToJson(user),
    );
    print(userToJson(user));

    final json = jsonDecode(response.body);
    //var token1 = json['Token'];
    print(json);

    print(response.statusCode);

    if (response.statusCode == 200) {
      //User newUser = userFromJson(response.body);
      return null;
    } else {
      throw Exception("Falha na comunicação com o servidor");
    }
  }
}
