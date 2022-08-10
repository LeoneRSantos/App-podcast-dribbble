import 'package:flutter/material.dart';

class CategoriaTopo{
  
  static const Color corInativa = Color(0xFFB5B6B6);
  static const Color corAtiva = Colors.amber;

  double tamanhoTextoAtivo = 26.0;
  double tamanhoTextoInativo = 20.0;

  int _indiceCategoria = 0;

  int verificarIndiceCategoria(String nomeDaCategoria){
    
    if (nomeDaCategoria == 'Popular') {
      _indiceCategoria = 0;
      debugPrint('Indice da categoria: $_indiceCategoria');
      return _indiceCategoria;
    }
    
    else if(nomeDaCategoria == 'Destaque'){
      _indiceCategoria = 1;
      debugPrint('Indice da categoria: $_indiceCategoria');
      return _indiceCategoria;
    }

    else if(nomeDaCategoria == 'Tendências'){
      _indiceCategoria = 2;
      debugPrint('Indice da categoria: $_indiceCategoria');
      return _indiceCategoria;
    }

    debugPrint('Indice da categoria: $_indiceCategoria');
    return 0;
  }

}