import 'package:flutter/material.dart';
import '../widgets/textos.dart';

class Salvos extends StatelessWidget {
  const Salvos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        backgroundColor: Theme.of(context).colorScheme.background,
        
        appBar: AppBar( 
        title: Row(
          children: [
            Textos(
              conteudo: 'Podcasts que você salvou', 
              cor: Theme.of(context).colorScheme.primary, 
              tamanho: 26.0), 

            Icon(Icons.bookmark, 
            color: Theme.of(context).colorScheme.onSurface, 
            size: 26.0,),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
      ),

      body: Center(
        child: Text('Você ainda não salvou nenhum podcast.',
        textAlign: TextAlign.center,
        style: TextStyle( 
          color: Theme.of(context).colorScheme.primary,
          fontSize: 26.0,
        ),),
      ),
        
      
      ), 
      );
  }
}