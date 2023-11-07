import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text_form_field.dart';
import 'routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(27, 77, 101, 1),
              Color.fromRGBO(45, 149, 142, 1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CustomTextFormField(
                labelText: 'Usuário',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: CustomTextFormField(
                labelText: 'Senha',
                obscureText: true,
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              width: 140,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, PageRoutes.informationsPage),
                child: const Text("Entrar"),
              ),
            ),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse("https://www.google.com.br/")),
              child: const Text(
                "Política de Privacidade",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
