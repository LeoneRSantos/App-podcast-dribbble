import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/app_bar_segunda_tela.dart';
import 'package:podcast_app_dribbble/widgets/bottom_bar_segunda_tela.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Player extends StatefulWidget {
  Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  IconData iconeSalvarInativo = Icons.bookmark_border_rounded;
  IconData iconePlayInativo = Icons.play_arrow;

  double _value = 1.7;
  double _valorRestante = 5.0;

  void pressionarPlay(){
    if (iconePlayInativo == Icons.play_arrow) {
      setState(() {
        iconePlayInativo = Icons.pause;
        
      });
    }

    else{
      setState(() {
        iconePlayInativo = Icons.play_arrow;
        
      });
    }
  }

  void salvarPodcast(){ 
    if (iconeSalvarInativo == Icons.bookmark_border_rounded) {
      setState(() {
        iconeSalvarInativo = Icons.bookmark;
      });
    }

    else{ 
      setState(() {
        iconeSalvarInativo = Icons.bookmark_border_rounded;
        
      });
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

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
            ),
            ), 

            // Slider de progresso do audio
            Container(
              width: double.maxFinite,
              child: CupertinoSlider(
                activeColor: Theme.of(context).colorScheme.onBackground,
                min: 0.0,
                max: 5.0,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                    
                  });
                  
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                
                children: [ 
                  Text('${_value.toStringAsFixed(2)}'),

                  Spacer(),

                  Text('${(_valorRestante-_value).toStringAsFixed(2)}'),
                ],
              ),
            ),
          ],
        ),  
        

        bottomNavigationBar: BottomBarSegundaTela( 
          iconeSalvar: iconeSalvarInativo,  
          iconePlay: iconePlayInativo, 
          play: pressionarPlay, 
          salvar: salvarPodcast,),
       
      ), 
      );
  }
}