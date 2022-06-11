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
  int pontuacaoTotal = 0;

  final List<Map<String, Object>> perguntas = [
    {
      "texto": "A coroa de jesus era de: ",
      "resposta": [
        {"texto": "palha", "pontuacao": 10},
        {"texto": "plástico", "pontuacao": 0},
        {"texto": "aço", "pontuacao": 0},
        {"texto": "metal", "pontuacao": 0},
      ],
    },
    {
      "texto": "Qual raiz quadrada de 25:",
      "resposta": [
        {"texto": "6", "pontuacao": 0},
        {"texto": "5", "pontuacao": 10},
        {"texto": "4", "pontuacao": 0},
        {"texto": "4.5", "pontuacao": 0},
      ],
    },
    {
      "texto": "Qual o idioma mais falado do mundo:",
      "resposta": [
        {"texto": "inglês", "pontuacao": 10},
        {"texto": "português", "pontuacao": 0},
        {"texto": "espanhol", "pontuacao": 0},
        {"texto": "italiano", "pontuacao": 0},
      ],
    },
    {
      "texto": "Quantas vezes o brasil foi campeão da copa do mundo:",
      "resposta": [
        {"texto": "5", "pontuacao": 10},
        {"texto": "6", "pontuacao": 0},
        {"texto": "4", "pontuacao": 0},
        {"texto": "3", "pontuacao": 0},
      ],
    },
    {
      "texto": "O steve jobs é o fundador de qual empresa de tecnologia:",
      "resposta": [
        {"texto": "Apple", "pontuacao": 10},
        {"texto": "Windows", "pontuacao": 0},
        {"texto": "Amazon", "pontuacao": 0},
        {"texto": "Netflix", "pontuacao": 0},
      ],
    },
  ];

  bool get validador {
    print("contador: ${perguntasContador}, lista: ${perguntas.length}");
    return perguntasContador < perguntas.length;
  }

  void resposta(int pontuacao) {
    if (validador) {
      setState(() {
        pontuacaoTotal += pontuacao;
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
                      pontuacaoTotal = 0;
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
            : Resultado(
                pontuacaoTotal: pontuacaoTotal,
              ));
  }
}
