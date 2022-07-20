import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class Topo extends StatelessWidget {
  const Topo({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    ColorScheme cores = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row( 
        children: [ 
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Textos(conteudo: 'Olá Leone', cor: cores.secondary, tamanho: 23.0), 

              Row(
                children: [
                  Textos(conteudo: 'Boa noite! ', cor: cores.primary, tamanho: 26.0), 

                  Icon(Icons.waving_hand, color: Colors.amber,)
                ],
              ),
            ],
          ), 

          Spacer(),

          Container( 
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all( 
                width: 2.0, 
                color: cores.primary,
              )
            ), 

            child: Icon(Icons.notifications_outlined, size: 32.0,),
          )
        ],
      ),
    );
  }
}