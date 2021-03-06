import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  Questionario(
      {required this.perguntasContador,
      required this.perguntas,
      required this.quandoResponder,
      Key? key})
      : super(key: key);

  final List<Map<String, Object>> perguntas;
  var perguntasContador;
  final void Function(int) quandoResponder;

  bool get validador {

    return perguntasContador < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        validador ? perguntas[perguntasContador].cast()['resposta'] : [];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Center(
        child: Column(
          children: [
            Questao(perguntas[perguntasContador]['texto'].toString()),
            SizedBox(
              height: 20,
            ),
            ...respostas.map((resp) {
              return Resposta(
                resp['texto'].toString(),
                () => quandoResponder(int.parse(resp["pontuacao"].toString())),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
