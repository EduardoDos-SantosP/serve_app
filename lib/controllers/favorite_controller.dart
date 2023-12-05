import 'package:get/get.dart';

import '../models/servico.dart';

class FavoriteController extends GetxController {
  final List<Servico> _servicos = List<Servico>.empty(growable: true).obs;

  void toggle(Servico s) =>
      _servicos.contains(s) ? _servicos.remove(s) : _servicos.add(s);

  int count() => _servicos.length;
}
