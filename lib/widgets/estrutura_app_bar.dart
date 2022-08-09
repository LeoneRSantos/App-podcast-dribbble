import 'package:flutter/material.dart';

import 'textos.dart';

class EstruturaAppBar extends StatelessWidget {
  const EstruturaAppBar({Key? key,  
  required this.texto,  
  required this.icone}) : super(key: key);

  final String texto;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Textos(
              conteudo: texto, 
              cor: Theme.of(context).colorScheme.primary, 
              tamanho: 26.0), 

            Icon(icone, 
            color: Theme.of(context).colorScheme.onSurface, 
            size: 26.0,),
          ],
        );
  }
}