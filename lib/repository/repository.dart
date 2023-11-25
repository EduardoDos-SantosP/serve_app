import 'dart:convert';

import 'package:http/http.dart';

import '../models/model.dart';

abstract class Repository<T extends Model> {
  final _baseUrl = 'http://10.0.2.2:8000';

  String get resource;

  T getModel(Map<String, dynamic> json);

  Uri _getUri({String? urlOptions}) => Uri.parse(
        '$_baseUrl/$resource${urlOptions != null ? '/$urlOptions' : ''}',
      );

  Future<List<T>> getAll() async {
    var response = await get(_getUri());
    validate(response);
    return (jsonDecode(response.body) as List)
        .cast<Map<String, dynamic>>()
        .map(getModel)
        .toList();
  }

  void validate(Response response) {
    if (200 <= response.statusCode && response.statusCode < 300) return;
    //TODO: tratar erro
  }
}
