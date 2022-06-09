import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  Questionario(this.perguntasContador, this.perguntas, this.respostas,
      this.resposta, {Key? key}) : super(key: key);

  List perguntas = [];
  List respostas = [];
  int perguntasContador;
  void Function() resposta;


  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Center(
        child: Column(
          children: [
            Questao(perguntas[perguntasContador]['texto'].toString()),
            SizedBox(
              height: 20,
            ),
            ...respostas.map((e) => Resposta(e, resposta)).toList(),
          ],
        ),
      ),
    );
  }
}
