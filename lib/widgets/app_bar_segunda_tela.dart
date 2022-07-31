import 'package:flutter/material.dart';

class AppBarSegundaTela extends StatelessWidget {
  const AppBarSegundaTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar( 
      title: Container(
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
          color: Theme.of(context).colorScheme.primary,),
        ),
      ),

      actions: [ 
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
        ), 
        ),
      ],
    );
  }
}