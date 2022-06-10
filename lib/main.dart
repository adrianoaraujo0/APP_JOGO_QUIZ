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

  final List<Map<String, Object>> perguntas = [
    {
      "texto": "A coroa de jesus era de: ",
      "resposta": [
        {"texto": "palha", "nota": 10},
        {"texto": "aço", "nota": 0},
        {"texto": "metal", "nota": 0},
      ],
    },
    {
      "texto": "Qual raiz quadrada de 25:",
      "resposta": [
        {"texto": "6", "nota": 10},
        {"texto": "5", "nota": 0},
        {"texto": "4", "nota": 0},
      ],
    },
    {
      "texto": "Qual o idioma mais falado do mundo:",
      "resposta": [
        {"texto":"inglês", "nota":10},
        {"texto":"português","nota":0},
        {"texto":"espanhol","nota":0},
      ],
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
            ? Questionario(
                perguntasContador: perguntasContador,
                perguntas: perguntas,
                quandoResponder: resposta)
            : Resultado());
  }
}
