import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.nomeButao, this.onSelect, {Key? key}) : super(key: key);

  final String nomeButao;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
        ),
        onPressed: onSelect,
        child: Text(nomeButao),
      ),
    );
  }
}
