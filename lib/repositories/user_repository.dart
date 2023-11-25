import 'dart:convert';
import 'dart:io';
import 'package:serve_app/models/user.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<User?> newUser(User post) async {
    final token = " ajksjdflkajsdf lkjaksdfj lajdsfklja sdkfj askdfj kas";
    final Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.post(url,
        headers: {"Authorization": "Bearer $token"}, body: userToJson(post));

    if (response == 200) {
      User user = userFromJson(response.body);
      return user;
    } else {
      Exception("Falha na comunicação com o servidor");
    }

    return null;
  }
}
