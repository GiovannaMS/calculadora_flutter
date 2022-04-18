import 'package:calculadora/components/button.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons; //recebe lista de botões

  ButtonRow(this.buttons);

  @override
  Widget build(BuildContext context) {
    return Expanded( 
      flex: 1,
      child: Row( //retorna uma fileira
        crossAxisAlignment: CrossAxisAlignment.stretch, //estica os botões no eixo vertical
        children: buttons,
      ),
    ); 
  }
}
