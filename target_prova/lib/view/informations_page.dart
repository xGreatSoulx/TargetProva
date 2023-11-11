import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_text_form_field.dart';

class InformationsPage extends StatefulWidget {
  const InformationsPage({super.key});

  @override
  State<InformationsPage> createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  List<String> informations = [
    'TESTE1',
    'TESTE2',
    'TESTE3',
    'TESTE4',
  ];

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Texto Digitado 1',
                          style: TextStyle(color: Colors.black),
                        ),
                        const Icon(Icons.edit),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Removendo..."),
                                content: const Text(
                                    "Deseja remover essa informação?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      informations.remove('TESTE1');
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Sim'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Não'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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

// Stack(
//                                   clipBehavior: Clip.none,
//                                   children: [
//                                     const Padding(
//                                       padding: EdgeInsets.all(24.0),
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 8.0),
//                                             child: Icon(
//                                               Icons.warning_amber_rounded,
//                                               color: Colors.amber,
//                                               size: 50,
//                                             ),
//                                           ),
//                                           Text('Atenção'),
//                                         ],
//                                       ),
//                                     ),
//                                     Align(
//                                       alignment: Alignment.topRight,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8.0, vertical: 4.0),
//                                         child: IconButton(
//                                           icon: const Icon(Icons.cancel),
//                                           padding: EdgeInsets.zero,
//                                           onPressed: () =>
//                                               Navigator.pop(context),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
                                