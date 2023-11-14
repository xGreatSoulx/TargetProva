import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text_form_field.dart';
import '../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//TODO | Ajustar o validator dos campos
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
              const Spacer(),
              CustomTextFormField(
                controller: usuarioController,
                labelText: 'Usuário',
                maxLength: 20,
                prefixIcon: const Icon(Icons.person),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[^ ]*"))
                ],
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório!';
                  }

                  return null;
                },
              ),
              const Divider(height: 20),
              CustomTextFormField(
                controller: senhaController,
                labelText: 'Senha',
                maxLength: 20,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("^[a-zA-Z0-9]*"))
                ],
                validator: (value) {
                  if (value!.length < 2) {
                    return 'Carácteres insuficientes!';
                  }

                  return null;
                },
              ),
              const Divider(height: 30),
              SizedBox(
                width: 160,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      usuarioController.text = '';
                      senhaController.text = '';
                      Navigator.pushNamed(context, PageRoutes.informationsPage);
                    }
                  },
                  child: const Text("Entrar"),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () =>
                      launchUrl(Uri.parse("https://www.google.com.br/")),
                  child: const Text(
                    "Política de Privacidade",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
