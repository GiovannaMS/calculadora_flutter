// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1); 
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text; //espera receber uma string
  final bool big; //para botões maiores
  final Color color;
  final void Function(String) cb; //callback dos botões

  Button({
    required this.text, //recebe um text por parâmetro
    this.big = false, //false por padrão
    this.color = DEFAULT,
    required this.cb,
  });

  Button.big({
  required this.text, //recebe um text por parâmetro
  this.big = true, //true por padrão
  this.color = DEFAULT,
  required this.cb,
  });

  Button.operation({
  required this.text, //recebe um text por parâmetro
  this.big = false, //false por padrão
  this.color = OPERATION,
  required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded( //expande a fileira de botões por toda a largura da tela
      flex: big ? 2 : 1, //se for um botão grande é flex 2 senão é 1
      child: RaisedButton(
        color: this.color, //cor do fundo dos botões
        child: Text(
          text,
          style: TextStyle( //estiliza os valores dos botões
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ), //um child do tipo texto com o text recebido por parâmetro
        onPressed: () => cb(text),
      ),
    );
  }
}