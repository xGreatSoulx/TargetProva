import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text_form_field.dart';

class InformationsPage extends StatefulWidget {
  const InformationsPage({super.key});

  @override
  State<InformationsPage> createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
            ),
            CustomTextFormField(
              textAlign: TextAlign.center,
              hintText: 'Digite o seu texto',
              validator: (value) {
                if (value == "") {
                  return 'Campo obrigatório!';
                }

                return null;
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse("https://www.google.com.br/")),
                child: const Text(
                  "Política de Privacidade",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
