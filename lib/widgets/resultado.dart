import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({required this.pontuacaoTotal, Key? key}) : super(key: key);
  final int pontuacaoTotal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Pontuação total: $pontuacaoTotal",
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
