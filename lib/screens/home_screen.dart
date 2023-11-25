import 'package:flutter/material.dart';
import 'package:serve_app/repository/repository.dart';
import 'package:serve_app/repository/servico_repository.dart';
import 'package:serve_app/widgets/custom_app_bar.dart';

import '../models/servico.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _list = ['Lorem', 'Ipsum', 'Test'];
  final Repository<Servico> _repository = ServicoRepository();
  List<Servico> _servicos = [];

  @override
  void initState() {
    super.initState();
    _repository.getAll().then((value) => setState(() => _servicos = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ta dando erro nessa budega aqui
        appBar: const CustomAppBar("Serviços"),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(4),
                child: const TextField(
                  decoration: InputDecoration(
                    label: Text('Pesquisar'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
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
