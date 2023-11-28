import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serve_app/screens/home_screen.dart';
import 'package:serve_app/screens/register_screen.dart';
import 'package:serve_app/models/user.dart';
import 'package:serve_app/repositories/user_repository.dart';

class LoguinScreen extends StatefulWidget {
  const LoguinScreen({super.key});

  @override
  State<LoguinScreen> createState() => _LoguinScreenState();
}

class _LoguinScreenState extends State<LoguinScreen> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Hero(
              tag: 'hero',
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 48,
                child: Image.asset("assets/logo.png"),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              //keyboardType: TextInputType.emailAddress,
              autofocus: false,
              controller: _loginController,
              decoration: InputDecoration(
                  hintText: "Login",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autofocus: false,
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: "Senha",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32))),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text('Cadastro',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        //rota temporaria
                        Get.to(() => HomeScreen());

                        print("Tentando logar.");
                        User user = User(
                          id: 1,
                          name: "",
                          login: _loginController.text,
                          password: _passwordController.text,
                          tipo: "",
                          token: "",
                        );

                        try {
                          User? loginUser = await UserRepository().Login(user);
                          if (loginUser != null) {
                            print("Logon efetuado com sucesso.");
                            Get.to(() => HomeScreen());
                          } else {
                            print("Logon não efetuado com sucesso.");
                          }
                        } catch (e) {
                          print("Erro: $e");
                        }
                      },
                      child:
                          Text('Entrar', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
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
