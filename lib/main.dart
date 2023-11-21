import 'package:flutter/material.dart';
import 'package:serve_app/widgets/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final _titulo = 'Serviços';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _titulo,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: false,
      ),
      home: MyHomePage(title: _titulo),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _list = ['Lorem', 'Ipsum', 'Test'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(widget.title),
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
