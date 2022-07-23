import 'package:flutter/material.dart';

class Textos extends StatefulWidget {
  const Textos({Key? key,  
  required this.conteudo, 
  required this.cor, 
  required this.tamanho}) : super(key: key); 

  final String conteudo;
  final double tamanho;
  final Color cor;

  @override
  State<Textos> createState() => _TextosState();
}

class _TextosState extends State<Textos> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.conteudo, 
    style: TextStyle(color: widget.cor, fontSize: widget.tamanho),);
  }
}