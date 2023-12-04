import 'package:flutter/material.dart';
import 'package:serve_app/repository/repository.dart';
import 'package:serve_app/repository/servico_repository.dart';
import 'package:serve_app/widgets/custom_app_bar.dart';

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

  void loadItens(String pesquisa) {
    _repository
        .getAll(widget.token, pesquisa)
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
        appBar: const CustomAppBar("Serviços"),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
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
