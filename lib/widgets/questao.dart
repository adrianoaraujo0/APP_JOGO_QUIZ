import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  const Questao(this.pergunta, {Key? key}) : super(key: key);

  final String pergunta;

  @override
  Widget build(BuildContext context) {
    return Text(
      pergunta,
      style: TextStyle(fontSize: 25),
    );
  }
}
