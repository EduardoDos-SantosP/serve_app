import 'package:flutter/material.dart';
import 'package:serve_app/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:serve_app/repositories/user_repository.dart';
import 'package:serve_app/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

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
                prefixIcon: Icon(Icons.account_circle),
                controller: _nameController,
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: "Login",
                prefixIcon: Icon(Icons.account_circle),
                controller: _loginController,
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: "password",
                prefixIcon: Icon(Icons.lock),
                controller: _passwordController,
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: "Tipo",
                prefixIcon: Icon(Icons.account_circle),
                controller: _typeController,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  print("Tentando criar usuario.");
                  User user = User(
                    //id: 1,
                    name: _nameController.text,
                    email: _loginController.text,
                    password: _passwordController.text,
                    tipo: _typeController.text,
                  );

                  try {
                    User? createdUser = await UserRepository().newUser(user);
                    if (createdUser != null) {
                      print("Usuário criado com sucesso");
                      Get.back();
                    } else {
                      print(
                          "Usuário não foi criado (pode tratar de outra forma)");
                    }
                  } catch (e) {
                    print("Erro: $e");
                  }
                },
                child: Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
