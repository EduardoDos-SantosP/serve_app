import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serve_app/controllers/favorite_controller.dart';
import 'package:serve_app/repository/repository.dart';
import 'package:serve_app/repository/servico_repository.dart';
import 'package:serve_app/screens/service_screen.dart';
import 'package:serve_app/widgets/custom_app_bar.dart';
import 'package:serve_app/widgets/favorite_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/servico.dart';

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Repository<Servico> _repository = ServicoRepository();
  List<Servico> _servicos = [];
  final FavoriteController _favoriteController = Get.put(FavoriteController());
  bool _showFavorites = false;

  void loadItens(String pesquisa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('token');

    _repository
        .getAll(pesquisa)
        .then((value) => setState(() => _servicos = value));
  }

  @override
  void initState() {
    super.initState();
    loadItens('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          "Serviços",
          button: Row(
            children: [
              FavoriteButton(onTap: () {
                _showFavorites = !_showFavorites;
                setState(() {
                  if (_showFavorites) {
                    _servicos = _favoriteController.getAll();
                  } else {
                    loadItens('');
                  }
                });
              }),
              Container(
                //margin: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    Get.to(() => const ServiceScreen());
                  },
                  child: const SizedBox(
                    width: 25,
                    height: 25,
                    child: Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _showFavorites
                  ? const Text('Favoritos')
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(4),
                      child: TextField(
                        decoration: const InputDecoration(
                          label: Text('Pesquisar'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        onChanged: loadItens,
                      ),
                    ),
              Flexible(
                child: ListView.builder(
                  itemCount: _servicos.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(_servicos[i].nome),
                        subtitle: Text(_servicos[i].preco.toStringAsFixed(2)),
                        dense: true,
                        onTap: () {
                          _favoriteController.toggle(_servicos[i]);
                          Get.snackbar('Favoritos atualizado', '',
                              backgroundColor: Colors.white,
                              duration: Duration(seconds: 1),
                              animationDuration: Duration(milliseconds: 300));
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
