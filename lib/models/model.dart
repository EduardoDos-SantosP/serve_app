import 'dart:convert';

import 'package:serve_app/models/servico.dart';

abstract class Model {
  String id;

  Model(this.id);

  Map<String, dynamic> toJsonObj() => {'id': id};

  factory Model.test() => Servico('', '', 1);

  String toJson() => jsonEncode(toJsonObj());
}
