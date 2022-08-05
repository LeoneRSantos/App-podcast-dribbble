import 'package:flutter/material.dart';

class BottomBarSegundaTela extends StatefulWidget {
  BottomBarSegundaTela({Key? key, 
  required this.iconeSalvar, 
  required this.iconePlay, 
  required this.play, 
  required this.salvar, 
  required this.avancarPlayer, 
  required this.voltarPlayer}) : super(key: key);

  final IconData iconeSalvar;
  final IconData iconePlay;
  final void Function() play;
  final void Function() salvar;
  final void Function() avancarPlayer;
  final void Function() voltarPlayer;

  @override
  State<BottomBarSegundaTela> createState() => _BottomBarSegundaTelaState();
}

class _BottomBarSegundaTelaState extends State<BottomBarSegundaTela> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [ 
          GestureDetector( 
            onTap: widget.salvar,
            child: ComponenteIcone(icone: widget.iconeSalvar)),

          GestureDetector( 
            onTap: widget.voltarPlayer,
            child: ComponenteIcone(icone: Icons.skip_previous)),

          Container(
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(50.0),
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: IconButton(
              color: Theme.of(context).colorScheme.background,
              onPressed: widget.play, 
              icon: Icon(widget.iconePlay)),
          ),

          GestureDetector( 
            onTap: widget.avancarPlayer,
            child: ComponenteIcone(icone: Icons.skip_next)), 

          ComponenteIcone(icone: Icons.arrow_downward_rounded),
        ],
      ),
    );
  }
}

class ComponenteIcone extends StatelessWidget {
  ComponenteIcone({Key? key, 
  required this.icone}) : super(key: key);

  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Icon(icone, size: 25.0, 
        color: Theme.of(context).colorScheme.primary,);
  }
}