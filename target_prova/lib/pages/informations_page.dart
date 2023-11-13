import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text_form_field.dart';

class InformationsPage extends StatefulWidget {
  const InformationsPage({super.key});

  @override
  State<InformationsPage> createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? hashCodeCurrentInformation;

  String currentInformation = '';
  List<String> informations = [
    'INFO1',
    'INFO2',
    'INFO3',
    'INFO4',
  ];

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ListView.builder(
                  itemCount: informations.length,
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
                                  onPressed: () {
                                    setState(() {
                                      currentInformation = informations[index];
                                      hashCodeCurrentInformation =
                                          informations[index].hashCode;
                                    });
                                  },
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
                                              informations
                                                  .remove(informations[index]);
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
                              informations[index],
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
              CustomTextFormField(
                controller: TextEditingController(text: currentInformation),
                textAlign: TextAlign.center,
                autofocus: true,
                hintText: 'Digite o seu texto',
                validator: (value) {
                  if (value == "") {
                    return 'Campo obrigatório!';
                  }

                  return null;
                },
                onFieldSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    if (hashCodeCurrentInformation != null) {
                      informations = informations.map((information) {
                        if (information.hashCode ==
                            hashCodeCurrentInformation) {
                          return currentInformation;
                        }
                        return information;
                      }).toList();
                    } else {
                      informations.add(currentInformation);
                    }

                    currentInformation = '';
                    hashCodeCurrentInformation = null;

                    setState(() {});
                  }
                },
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
