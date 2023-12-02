import 'package:serve_app/repository/repository.dart';

import '../models/servico.dart';

class ServicoRepository extends Repository<Servico> {
  @override
  String get resource => 'servico';

  @override
  Servico getModel(Map<String, dynamic> json) => Servico.fromJsonObj(json);
}
