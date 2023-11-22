import 'package:flutter/material.dart';
import 'package:serve_app/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _list = ['Lorem', 'Ipsum', 'Test'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ta dando erro nessa budega aqui
        //appBar: CustomAppBar(widget.title),
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(4),
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
              itemCount: _list.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(_list[i]),
                    subtitle: Text((i + 1).toStringAsFixed(2)),
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
