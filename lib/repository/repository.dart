import 'dart:convert';

import 'package:http/http.dart';
import 'package:serve_app/utils/api_endpoints.dart';

import '../models/model.dart';

abstract class Repository<T extends Model> {
  final _baseUrl = 'http://${ApiEndPoints.baseUrl}:8000';
  final Map<String, String> baseHeaders = {
    'content-type': 'application/json; charset=utf-8'
  };

  String get resource;

  T getModel(Map<String, dynamic> json);

  Uri getUri({String? resource, String? urlOptions}) => Uri.parse(
        '$_baseUrl/${resource ?? this.resource}/${urlOptions ?? ''}',
      );

  Future<List<T>> getAll(String token, String pesquisa) async {
    baseHeaders['authorization'] = token;
    var response = await get(
      getUri(urlOptions: '?nome=$pesquisa'),
      headers: baseHeaders,
    );
    var decoded = jsonDecode(response.body);
    validateResponse(decoded);
    return (decoded as List)
        .cast<Map<String, dynamic>>()
        .map(getModel)
        .toList();
  }

  Future<T> create(T obj) async {
    var map = obj.toJsonObj();
    var body = jsonEncode(map);
    final Uri url = Uri.parse("http://192.168.0.10:8000/usuario");
    var response = await post(
      url,
      body: body,
      headers: baseHeaders,
    );
    print(jsonEncode(map));

    final json = jsonDecode(response.body);

    print(response.statusCode);
    validateResponse(json);

    if (response.statusCode == 200) {
      return obj;
      //return getModel(decoded as Map<String, dynamic>);
    } else {
      throw Exception("Falha na comunicação com o servidor");
    }
  }

  void validateResponse(dynamic responseBody) {
    if (responseBody is Map && responseBody.containsKey('error')) {
      throw Exception(responseBody['error']);
    }
  }
}
