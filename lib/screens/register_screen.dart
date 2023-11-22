import 'package:flutter/material.dart';
import 'package:serve_app/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
            labelText: "e-mail",
            prefixIcon: Icon(Icons.account_circle),
            controller: _emailController,
          ),
          SizedBox(height: 16),
          CustomTextField(
            labelText: "password",
            prefixIcon: Icon(Icons.account_circle),
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
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Cadastrar",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.orange),
          ),
        ],
      )),
    );
  }
}
