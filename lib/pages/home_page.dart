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
  
  double _tamanhoInicialTexto = 25.0;
  Color _corInicialTexto = Color(0xFFB5B6B6);

  void _categoriaSelecionada(){
    if (_corInicialTexto == Color(0xFFB5B6B6)) {
      setState(() {
        _corInicialTexto = Color(0xFF050507);
        _tamanhoInicialTexto = 30.0;
       
      });
      debugPrint('SetState');
    }

    else if (_corInicialTexto == Color(0xFF050507)){
      setState(() {
        _corInicialTexto = Color(0xFFB5B6B6);
        _tamanhoInicialTexto = 25.0;
        
      });
    }

    debugPrint('Categoria Selecionada');
  }


  @override
  Widget build(BuildContext context) {

  ColorScheme cores = Theme.of(context).colorScheme;

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