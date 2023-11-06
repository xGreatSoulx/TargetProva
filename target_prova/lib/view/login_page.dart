import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(),
            const TextField(),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.informationsPage),
              child: const Text("Entrar"),
            ),
            GestureDetector(
              onTap: () =>
                  launchUrl(Uri.parse("https://www.google.com.br/")),
              child: const Text("Política de Privacidade"),
            ),
          ],
        ),
      ),
    );
  }
}
