import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/app_bar_segunda_tela.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Player extends StatefulWidget {
  Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {

    ColorScheme cores = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold( 
        backgroundColor: cores.background,

        appBar: AppBar( 
          elevation: 0.0,
          backgroundColor: cores.background,
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all( 
                    width: 1.0, 
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ),

                child: IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.arrow_back_ios_new, 
                  color: Theme.of(context).colorScheme.primary, 
                  size: 20.0,),
                ),
                ),

              Spacer(),

              Container( 
                decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all( 
                  width: 1.0, 
                  color: Theme.of(context).colorScheme.secondary,
                )
              ),

              child: Icon(Icons.music_note,
              color: Theme.of(context).colorScheme.primary,
              size: 35.0,
              ), 
              ),
            ],
          ),

          
        ),

        body: Column( 
          children: [ 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: Image.asset('assets/images/flow.jpg'),),
            ),

            Text('FALCÃO 12 - Flow #74 🤝 @Flow Sport Club',
            textAlign: TextAlign.center, 
            style: TextStyle( 
              color: cores.primary, 
              fontSize: 30.0,
            ),)
          ],
        ),  
         
       
      ), 
      );
  }
}