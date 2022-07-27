import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/categorias_topo.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';
import 'package:podcast_app_dribbble/widgets/topo.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // Tamanho inicial de cada texto de Categoria
  double _tamanhoInicialTexto1 = 22.0;
  double _tamanhoInicialTexto2 = 18.0;
  double _tamanhoInicialTexto3 = 18.0;

  // Cores dos textos de cada Categoria
  Color _corInicialTexto1 = Color(0xFFB5B6B6);
  Color _corInicialTexto2 = Color(0xFFB5B6B6);
  Color _corInicialTexto3 = Color(0xFFB5B6B6);

  int selectedIndex = 0;

  void _categoriaSelecionada(){
    if (_corInicialTexto1 == Color(0xFFB5B6B6)) {
      setState(() {
        _corInicialTexto1 = Color(0xFF050507);
        _tamanhoInicialTexto1 = 26.0;
       
      });
      debugPrint('SetState');
    }

    else if (_corInicialTexto1 == Color(0xFF050507)){
      setState(() {
        _corInicialTexto1 = Color(0xFFB5B6B6);
        _tamanhoInicialTexto1 = 22.0;
        
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
          corTexto1: _corInicialTexto1, 
          corTexto2: _corInicialTexto2,
          corTexto3: _corInicialTexto3,
          tamanhoTexto1: _tamanhoInicialTexto1, 
          tamanhoTexto2: _tamanhoInicialTexto2,
          tamanhoTexto3: _tamanhoInicialTexto3,),
        
        ],
      ),

      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        iconSize: 30,
        activeColor: Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Explorar',
          ),
          BarItem(
            icon: Icons.bookmark_outlined,
            title: 'Salvos',
          ),
          BarItem(
            icon: Icons.settings_outlined,
            title: 'Configurações',
          ),
           /// Add more BarItem if you want
        ],
      ),
    ),
  );
  }
}