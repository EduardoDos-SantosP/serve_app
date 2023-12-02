import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serve_app/models/usuario.dart';
import 'package:serve_app/repository/usuario_repository.dart';
import 'package:serve_app/screens/home_screen.dart';
import 'package:serve_app/screens/register_screen.dart';

class LoguinScreen extends StatefulWidget {
  const LoguinScreen({super.key});

  @override
  State<LoguinScreen> createState() => _LoguinScreenState();
}

class _LoguinScreenState extends State<LoguinScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48,
                child: Image.asset("assets/logo.png"),
              ),
            ),
            const SizedBox(height: 48),
            TextFormField(
              //keyboardType: TextInputType.emailAddress,
              autofocus: false,
              controller: _loginController,
              decoration: InputDecoration(
                  hintText: "Login",
                  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autofocus: false,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Senha",
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const RegisterScreen());
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                    child: const Text(
                      'Cadastro',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      var user = Usuario.toLogin(
                        _loginController.text,
                        _passwordController.text,
                      );

                      try {
                        var token = await UsuarioRepository().login(user);
                        Get.to(() => HomeScreen(token: token));
                      } catch (e) {
                        print("Erro: $e");
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
