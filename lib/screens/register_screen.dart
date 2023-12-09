import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serve_app/models/usuario.dart';
import 'package:serve_app/repository/usuario_repository.dart';
import 'package:serve_app/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

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
                prefixIcon: const Icon(Icons.account_circle),
                controller: _nameController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: "Login",
                prefixIcon: const Icon(Icons.account_circle),
                controller: _loginController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: "password",
                prefixIcon: const Icon(Icons.lock),
                controller: _passwordController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                labelText: "Tipo",
                prefixIcon: const Icon(Icons.account_circle),
                controller: _typeController,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  var user = Usuario(
                    '',
                    _nameController.text,
                    _loginController.text,
                    _passwordController.text,
                    _typeController.text,
                  );

                  try {
                    await UsuarioRepository().create(user);
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
