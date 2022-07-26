import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/categoria_topo.dart';
import 'package:podcast_app_dribbble/widgets/carrossel_de_podcasts.dart';
import 'package:podcast_app_dribbble/widgets/categorias_topo.dart';
import 'package:podcast_app_dribbble/widgets/reproduzidos_recentemente.dart';
import 'package:podcast_app_dribbble/widgets/topo.dart';

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

  // Auxiliar para selecionar a categoria do topo
  int _aux = 0;

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

  ColorScheme _cores = Theme.of(context).colorScheme;

  return SafeArea(
    child: Scaffold(
      backgroundColor: _cores.background,

      appBar: AppBar( 
        title: const Topo(),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
      ),
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
            children: [ 
      
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CategoriasTopo(
                corTexto1: _corInicialTexto1, 
                corTexto2: _corInicialTexto2,
                corTexto3: _corInicialTexto3,
                tamanhoTexto1: _tamanhoInicialTexto1, 
                tamanhoTexto2: _tamanhoInicialTexto2,
                tamanhoTexto3: _tamanhoInicialTexto3, 
                selecionarCategoriaUm: (){ 
                  _aux = categoria.verificarIndiceCategoria('Popular');
                  _categoriaSelecionada(_aux);
                },
                selecionarCategoriaDois: () { 
                  _aux = categoria.verificarIndiceCategoria('Destaque');
                  _categoriaSelecionada(_aux);
                }, 
                selecionarCategoriaTres: () { 
                  _aux = categoria.verificarIndiceCategoria('Tendências');
                  _categoriaSelecionada(_aux);
                },),
              ),
      
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CarroselDePodcasts(),
              ), 
      
              Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0),
                child: ReproduzidosRecentemente(),
              ),        
            
            ],
          ),
        ),
      ),

    ),
  );
  }
}