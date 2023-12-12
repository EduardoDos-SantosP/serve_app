import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serve_app/models/servico.dart';
import 'package:serve_app/repository/servico_repository.dart';
import 'package:serve_app/widgets/custom_text_field.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                labelText: "Nome",
                // prefixIcon: const Icon(Icons.account_circle),
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: "Preço",
                // prefixIcon: const Icon(Icons.account_circle),
                controller: _precoController,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  var servico = Servico(
                    '',
                    _nameController.text,
                    double.parse(_precoController.text),
                  );

                  try {
                    await ServicoRepository().create(servico);
                    Get.back();
                  } catch (e) {
                    print("Erro tela cadastro: $e");
                  }
                },
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
