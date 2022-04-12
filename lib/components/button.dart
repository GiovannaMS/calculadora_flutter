import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Button extends StatelessWidget {
  final String text; //espera receber uma string

  Button({
    required this.text, //recebe um text por parâmetro
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( //expande a fileira de botões por toda a largura da tela
      flex: 1, 
      child: RaisedButton(
        child: Text(text), //um child do tipo texto com o text recebido por parâmetro
        onPressed: () {},
      ),
    );
  }
}