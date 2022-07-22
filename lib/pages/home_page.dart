import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/categorias_topo.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';
import 'package:podcast_app_dribbble/widgets/topo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

  ColorScheme cores = Theme.of(context).colorScheme;

  Color _corInicialTexto = cores.secondary;
  double _tamanhoInicialTexto = 25.0;

  void _categoriaSelecionada(){
    if (_corInicialTexto == cores.secondary) {
      setState(() {
        _corInicialTexto = Colors.indigo;
        _tamanhoInicialTexto = 30.0;
       
      });
      debugPrint('SetState');
    }

    else if (_corInicialTexto == cores.primary){
      setState(() {
        _corInicialTexto = Colors.redAccent;
        _tamanhoInicialTexto = 50.0;
        
      });
    }

    debugPrint('Categoria Selecionada');
  }


    return SafeArea(
      child: Scaffold(
        backgroundColor: cores.background,
      
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
    
          children: [
            Topo(), 

            CategoriasTopo(
            corTexto: _corInicialTexto, 
            selecionarCategoria: _categoriaSelecionada, 
            tamanhoTexto: _tamanhoInicialTexto,),
          
          ],
        ),
      ),
    );
  }
}