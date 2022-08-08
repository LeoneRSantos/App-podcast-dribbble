import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/bottom_bar_segunda_tela.dart';

class Player extends StatefulWidget {
  Player({Key? key, 
  required this.imagemPlayer, 
  required this.tituloPlayer, 
  required this.listaDeImagens, 
  required this.listaDeTitulos, 
  required this.indiceDoComponente}) : super(key: key);

  late String imagemPlayer;
  late String tituloPlayer;

  final List<String> listaDeImagens;
  final List<String> listaDeTitulos;

  final int indiceDoComponente;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  // Ícones de salvar e de play
  IconData _iconeSalvarInativo = Icons.bookmark_border_rounded;
  IconData _iconePlayInativo = Icons.play_arrow;

  // indicadores de progresso do slider
  double _value = 1.30;
  double _valorRestante = 5.0;

  // Auxiliares para os botões de avançar e voltar
  late int _auxiliarPlayer = widget.indiceDoComponente;


  void _pressionarPlay(){
    if (_iconePlayInativo == Icons.play_arrow) {
      setState(() {
        _iconePlayInativo = Icons.pause;
        
      });
    }

    else{
      setState(() {
        _iconePlayInativo = Icons.play_arrow;
        
      });
    }
  }

  void _salvarPodcast(){ 
    if (_iconeSalvarInativo == Icons.bookmark_border_rounded) {
      setState(() {
        _iconeSalvarInativo = Icons.bookmark;
      });
    }

    else{ 
      setState(() {
        _iconeSalvarInativo = Icons.bookmark_border_rounded;
        
      });
    }
  }

  void _incrementarAuxiliarPlayer(){ 
    if (_auxiliarPlayer < 5) {
      _auxiliarPlayer++;
    }

    else if(_auxiliarPlayer == 5){ 
      _auxiliarPlayer = 0;
    }

    else{ 
      _auxiliarPlayer = widget.indiceDoComponente;
    }
    debugPrint('Incremento: $_auxiliarPlayer\n\n');
  }

  void _decrementarAuxiliarPlayer(){ 
    if(_auxiliarPlayer > 0){ 
      _auxiliarPlayer--;
    }

    else if(_auxiliarPlayer == 0){ 
      _auxiliarPlayer = 5;
    }

    else{ 
      _auxiliarPlayer = widget.indiceDoComponente;
    }

    debugPrint('Decremento: $_auxiliarPlayer\n\n');
  }


  void _voltarPodcast(){ 
    if(widget.indiceDoComponente >= 0){ 
      setState(() {
        widget.imagemPlayer = widget.listaDeImagens[_auxiliarPlayer];
        widget.tituloPlayer = widget.listaDeTitulos[_auxiliarPlayer];

        debugPrint('ìndice: ${widget.indiceDoComponente}\n Auxiliar: $_auxiliarPlayer');

        _decrementarAuxiliarPlayer();
      });
    }

    else if(widget.indiceDoComponente < 0){ 
       setState(() {

        widget.tituloPlayer = widget.listaDeTitulos[_auxiliarPlayer];

        debugPrint('ìndice: ${widget.indiceDoComponente}\n Auxiliar: $_auxiliarPlayer');
        
        _decrementarAuxiliarPlayer();
        
      });
    }
  }

  void _avancarPodcast(){ 
    if (widget.indiceDoComponente <= 5) {
      setState(() {
        
        widget.imagemPlayer = widget.listaDeImagens[_auxiliarPlayer];

        widget.tituloPlayer = widget.listaDeTitulos[_auxiliarPlayer];

        debugPrint('ìndice: ${widget.indiceDoComponente}\n Auxiliar: $_auxiliarPlayer');
        
        _incrementarAuxiliarPlayer();
      });
    }

    else if(widget.indiceDoComponente > 5){ 
      setState(() {

        widget.tituloPlayer = widget.listaDeTitulos[_auxiliarPlayer];

        debugPrint('ìndice: ${widget.indiceDoComponente}\n Auxiliar: $_auxiliarPlayer');
        
        _incrementarAuxiliarPlayer();
        
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
          automaticallyImplyLeading: false,
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

                  // Navegação de volta à Home
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  icon: Icon(Icons.arrow_back_ios_new, 
                  color: Theme.of(context).colorScheme.primary, 
                  size: 20.0,),
                ),
                ),

              const Spacer(),

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
              child: Center(child: Image.asset(widget.imagemPlayer),),
            ),

            Text(widget.tituloPlayer,
            textAlign: TextAlign.center, 
            style: TextStyle( 
              color: cores.primary, 
              fontSize: 25.0,
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

                  const Spacer(),

                  Text('${(_valorRestante-_value).toStringAsFixed(2)}'),
                ],
              ),
            ),
          ],
        ),  
        

        bottomNavigationBar: BottomBarSegundaTela( 
          iconeSalvar: _iconeSalvarInativo,  
          iconePlay: _iconePlayInativo, 
          play: _pressionarPlay, 
          salvar: _salvarPodcast, 
          avancarPlayer: _avancarPodcast, 
          voltarPlayer: _voltarPodcast,),
       
      ), 
      );
  }
}