import 'package:app_quiz/widgets/questionario.dart';
import 'package:app_quiz/widgets/resposta.dart';
import 'package:flutter/material.dart';
import 'package:app_quiz/widgets/questao.dart';

import 'widgets/resultado.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: perguntaApp(),
  ));
}

class perguntaApp extends StatefulWidget {
  const perguntaApp({Key? key}) : super(key: key);

  @override
  State<perguntaApp> createState() => _perguntaAppState();
}

class _perguntaAppState extends State<perguntaApp> {
  var perguntasContador = 0;
  final perguntas = [
    {
      "texto": "A coroa de jesus era de: ",
      "resposta": ["palha", "aço", "metal"],
    },
    {
      "texto": "Qual raiz quadrada de 25:",
      "resposta": ["6", "5", "4"],
    },
    {
      "texto": "Qual o idioma mais falado do mundo:",
      "resposta": ["inglês", "português", "espanhol"],
    }
  ];

  bool get validador {
    print("contador: ${perguntasContador}, lista: ${perguntas.length}");
    return perguntasContador < perguntas.length;
  }

  void resposta() {
    if (validador) {
      setState(() {
        perguntasContador++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        validador ? perguntas[perguntasContador].cast()['resposta'] : [];
    // List widgets = respostas.map((texto) => Resposta(texto, "resposta")).toList();

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => setState(() {
                      perguntasContador = 0;
                    })),
          ],
          title: Text("QUIZ"),
          centerTitle: true,
        ),
        body: validador
            ? Questionario(perguntasContador, perguntas, respostas, resposta)
            : Resultado());
  }
}
