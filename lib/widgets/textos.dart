import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  const Textos({Key? key,  
  required this.conteudo, 
  required this.cor, 
  required this.tamanho}) : super(key: key); 

  final String conteudo;
  final double tamanho;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Text(conteudo, 
    style: TextStyle(color: cor, fontSize: tamanho),);
  }
}