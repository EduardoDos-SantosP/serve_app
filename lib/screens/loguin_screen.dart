import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoguinScreen extends StatefulWidget {
  const LoguinScreen({super.key});

  @override
  State<LoguinScreen> createState() => _LoguinScreenState();
}

class _LoguinScreenState extends State<LoguinScreen> {
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
                child: Image.asset("assets;logo.png"),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Logon",
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
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Cadastro',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {},
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
