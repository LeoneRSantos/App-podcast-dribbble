import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class CategoriasTopo extends StatefulWidget {
  CategoriasTopo({Key? key, 
  required this.selecionarCategoria, 
  required this.corTexto1, 
  required this.corTexto2, 
  required this.corTexto3,
  required this.tamanhoTexto1, 
  required this.tamanhoTexto2, 
  required this.tamanhoTexto3}) : super(key: key);

  // Função
  final void Function() selecionarCategoria;

  // Cores
  final Color corTexto1;
  final Color corTexto2;
  final Color corTexto3;

  // Tamanhos
  final double tamanhoTexto1;
  final double tamanhoTexto2;
  final double tamanhoTexto3;

  @override
  State<CategoriasTopo> createState() => _CategoriasTopoState();
}

class _CategoriasTopoState extends State<CategoriasTopo> {
  @override
  Widget build(BuildContext context) {
    
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [ 
        GestureDetector(child: Textos(conteudo: 'Popular', cor: widget.corTexto1,tamanho: widget.tamanhoTexto1), 
        onTap: widget.selecionarCategoria,), 

        GestureDetector(child: Textos(conteudo: 'Destaque', cor: widget.corTexto2, tamanho: widget.tamanhoTexto2),
        onTap: (){},),

        GestureDetector(child: Textos(conteudo: 'Tendências', cor: widget.corTexto3, tamanho: widget.tamanhoTexto3),
        onTap: (){},),
      ],
    );
  }
}