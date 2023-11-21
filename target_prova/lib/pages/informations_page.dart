import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text_form_field.dart';
import '../store/information_store.dart';

class InformationsPage extends StatelessWidget {
  InformationsPage({super.key});

  final informationStore = InformationStore();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Observer(
                    builder: (_) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: informationStore.informations.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      'Texto Digitado $index',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () => informationStore
                                          .editInformation(index),
                                      icon: const Icon(
                                        Icons.edit,
                                        size: 32,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text("Removendo..."),
                                            content: const Text(
                                                "Deseja remover essa informação?"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  informationStore
                                                      .removeInformation(index);

                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Sim'),
                                              ),
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('Não'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red[800],
                                        size: 32,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(thickness: 0.5),
                                Text(
                                  informationStore.informations[index],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Observer(
                  builder: (_) => CustomTextFormField(
                    controller: TextEditingController(
                        text: informationStore.currentInformation),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    hintText: 'Digite o seu texto',
                    validator: (value) {
                      if (value == "") {
                        return 'Campo obrigatório!';
                      }

                      return null;
                    },
                    onChanged: informationStore.setCurrentInformation,
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        informationStore.addInformation();
                      }
                    },
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () =>
                        launchUrl(Uri.parse("https://www.google.com.br/")),
                    child: const Text(
                      "Política de Privacidade",
                    ),
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
