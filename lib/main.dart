import 'package:flutter/material.dart';
import 'package:serve_app/screens/loguin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const LoguinScreen(),
    );
  }
}
