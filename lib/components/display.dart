import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget {
  final String text;

  Display(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1, //display pegará toda a parte disponível da tela
      child: Container(
        color: Color.fromRGBO(48, 48, 48, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, //coloca o texto no final da coluna (embaixo)
          crossAxisAlignment: CrossAxisAlignment.stretch, //faz ocupar toda a largura da tela
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0), //adiciona espaçamento ao texto
              child: AutoSizeText(
                text,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end, //alinha o texto embaixo
                style: TextStyle(
                  fontWeight: FontWeight.w100, //espessura da fonte
                  decoration: TextDecoration.none,
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}