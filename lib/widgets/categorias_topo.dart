import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/categoria_topo.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class CategoriasTopo extends StatefulWidget {
  CategoriasTopo({Key? key, 
  required this.selecionarCategoriaUm, 
  required this.selecionarCategoriaDois, 
  required this.selecionarCategoriaTres, 
  required this.corTexto1, 
  required this.corTexto2, 
  required this.corTexto3,
  required this.tamanhoTexto1, 
  required this.tamanhoTexto2, 
  required this.tamanhoTexto3}) : super(key: key);

  // Funções
  final void Function() selecionarCategoriaUm;
  final void Function() selecionarCategoriaDois;
  final void Function() selecionarCategoriaTres;

  // Cores
  final Color corTexto1;
  final Color corTexto2;
  final Color corTexto3;

  // Tamanhos
  final double tamanhoTexto1;
  final double tamanhoTexto2;
  final double tamanhoTexto3;

  int _indiceCategoria = 0;

  int retornarIndice(int indiceAtual){
    
    _indiceCategoria = indiceAtual;

    debugPrint('Indice da categoria: $_indiceCategoria');
    return _indiceCategoria;
  }

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
        onTap: (){
          widget.retornarIndice(0);

          widget.selecionarCategoria;
        },), 

        GestureDetector(child: Textos(conteudo: 'Destaque', cor: widget.corTexto2, tamanho: widget.tamanhoTexto2),
        onTap: (){
          widget.retornarIndice(1);

          widget.selecionarCategoria;
        },),

        GestureDetector(child: Textos(conteudo: 'Tendências', cor: widget.corTexto3, tamanho: widget.tamanhoTexto3,),
        onTap: (){
          widget.retornarIndice(2);

          widget.selecionarCategoria;
        },),
      ],
    );
  }
}