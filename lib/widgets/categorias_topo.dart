import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class CategoriasTopo extends StatefulWidget {
  CategoriasTopo({Key? key, 
  required this.selecionarCategoria, 
  required this.corTexto, 
  required this.tamanhoTexto}) : super(key: key);

  final void Function() selecionarCategoria;
  final Color corTexto;
  final double tamanhoTexto;

  @override
  State<CategoriasTopo> createState() => _CategoriasTopoState();
}

class _CategoriasTopoState extends State<CategoriasTopo> {
  @override
  Widget build(BuildContext context) {
    
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [ 
        GestureDetector(child: Textos(conteudo: 'Popular', cor: widget.corTexto,tamanho: widget.tamanhoTexto), 
        onTap: widget.selecionarCategoria,), 

        GestureDetector(child: Textos(conteudo: 'Destaque', cor: widget.corTexto, tamanho: widget.tamanhoTexto),
        onTap: (){},),

        GestureDetector(child: Textos(conteudo: 'Tendências', cor: widget.corTexto, tamanho: widget.tamanhoTexto),
        onTap: (){},),
      ],
    );
  }
}