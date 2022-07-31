import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/categoria_topo.dart';
import 'package:podcast_app_dribbble/widgets/carrossel_de_podcasts.dart';
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

  // Objeto de CategoriaTopo
  CategoriaTopo categoria = CategoriaTopo();
  
  // Tamanho inicial de cada texto de Categoria
  late double _tamanhoInicialTexto1 = categoria.tamanhoTextoAtivo;
  late double _tamanhoInicialTexto2 = categoria.tamanhoTextoInativo;
  late double _tamanhoInicialTexto3 = categoria.tamanhoTextoInativo;

  // Cores dos textos de cada Categoria
  Color _corInicialTexto1 = CategoriaTopo.corAtiva;
  Color _corInicialTexto2 = CategoriaTopo.corInativa;
  Color _corInicialTexto3 = CategoriaTopo.corInativa;

  // Índice usado na BottomNavigation
  int selectedIndex = 0;

  // Auxiliar para selecionar a categoria do topo
  int aux = 0;

  void _categoriaSelecionada(int indice){
    if (indice == 0) {
      setState(() {
        _corInicialTexto1 = CategoriaTopo.corAtiva;
        _corInicialTexto2 = CategoriaTopo.corInativa;
        _corInicialTexto3 = CategoriaTopo.corInativa;

        _tamanhoInicialTexto1 = categoria.tamanhoTextoAtivo;
        _tamanhoInicialTexto2 = categoria.tamanhoTextoInativo;
        _tamanhoInicialTexto3 = categoria.tamanhoTextoInativo;
       
      });
      debugPrint('Popular');
    }

    else if (indice == 1){
      setState(() {
        _corInicialTexto2 = CategoriaTopo.corAtiva;
        _corInicialTexto1 = CategoriaTopo.corInativa;
        _corInicialTexto3 = CategoriaTopo.corInativa;
        
        _tamanhoInicialTexto2 = categoria.tamanhoTextoAtivo;
        _tamanhoInicialTexto1 = categoria.tamanhoTextoInativo;
        _tamanhoInicialTexto3 = categoria.tamanhoTextoInativo;
        
      });
      debugPrint('Destaque');
    }

    else if(indice == 2){
      setState(() {
        _corInicialTexto3 = CategoriaTopo.corAtiva;
        _corInicialTexto2 = CategoriaTopo.corInativa;
        _corInicialTexto1 = CategoriaTopo.corInativa;

        _tamanhoInicialTexto3 = categoria.tamanhoTextoAtivo;
        _tamanhoInicialTexto1 = categoria.tamanhoTextoInativo;
        _tamanhoInicialTexto2 = categoria.tamanhoTextoInativo;
        debugPrint('Tendências');
        
      });
    }
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
          corTexto1: _corInicialTexto1, 
          corTexto2: _corInicialTexto2,
          corTexto3: _corInicialTexto3,
          tamanhoTexto1: _tamanhoInicialTexto1, 
          tamanhoTexto2: _tamanhoInicialTexto2,
          tamanhoTexto3: _tamanhoInicialTexto3, 
          selecionarCategoriaUm: (){ 
            aux = categoria.verificarIndiceCategoria('Popular');
            _categoriaSelecionada(aux);
          },
          selecionarCategoriaDois: () { 
            aux = categoria.verificarIndiceCategoria('Destaque');
            _categoriaSelecionada(aux);
          }, 
          selecionarCategoriaTres: () { 
            aux = categoria.verificarIndiceCategoria('Tendências');
            _categoriaSelecionada(aux);
          },),

          CarroselDePodcasts(),         
        
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