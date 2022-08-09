import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/estrutura_app_bar.dart';

class Salvos extends StatelessWidget {
  const Salvos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        backgroundColor: Theme.of(context).colorScheme.background,
        
        appBar: AppBar( 
        title: const EstruturaAppBar(texto: 'Podcasts que você salvou',  
        icone: Icons.bookmark),
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