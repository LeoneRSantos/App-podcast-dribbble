import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/pages/explorar.dart';
import 'package:podcast_app_dribbble/pages/home_page.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class PaginaInicial extends StatefulWidget {
  PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {

  int _paginaAtual = 0; 
  late PageController _controladorDePaginas;

  @override
  void initState() {
    _controladorDePaginas = PageController(initialPage: _paginaAtual);
  }

  @override
  Widget build(BuildContext context) {

    ColorScheme _cores = Theme.of(context).colorScheme;

    return Scaffold( 
      body: PageView( 
        controller: _controladorDePaginas,
        children: [ 
          MyHomePage(), 
          Explorar(),
        ],
      ),

      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: _cores.background,
        onButtonPressed: (index) {
          setState(() {
            _controladorDePaginas.animateToPage(index,  
            duration: Duration(milliseconds: 400),  
            curve: Curves.ease);
            _paginaAtual = index;
          });
        },
        iconSize: 30,
        activeColor: _cores.primary,
        inactiveColor: _cores.secondary,
        selectedIndex: _paginaAtual,
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
            icon: Icons.bookmark_border_outlined,
            title: 'Salvos',
          ),
          BarItem(
            icon: Icons.settings_outlined,
            title: 'Configurações',
          ),
           /// Add more BarItem if you want
        ],
      ),
    );
  }
}