import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/pages/pagina_inicial.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Tema do app
  late ThemeData _tema = _temaClaro;

  // Tema claro
  final ThemeData _temaClaro = ThemeData(
    fontFamily: 'OC Pajaro Medium',
    colorScheme: const ColorScheme( 
      brightness: Brightness.light, 
      primary: Color(0xFF050507), 
      secondary: Color(0xFFB5B6B6), 
      onPrimary: Color(0xFFEB672B), 
      onSecondary: Color(0xFF424153), 
      background: Color(0XFFfbfdff), 
      onBackground: Color(0xFFF1A060), 
      surface: Color(0xFFB5B6B6), 
      onSurface: Colors.amber, 
      error: Colors.red, 
      onError: Colors.red, 
      tertiary: Color(0xFFDBB3AD)),
      
    );

    // Tema escuro
    final ThemeData _temaEscuro = ThemeData(
    fontFamily: 'OC Pajaro Medium',
    colorScheme: const ColorScheme( 
      brightness: Brightness.dark, 
      primary: Color(0XFFfbfdff), 
      secondary: Color(0xFF76ffff), 
      onPrimary: Color(0xFFEB672B), 
      onSecondary: Color(0xFF424153), 
      background: Color(0xFF000a12), 
      onBackground: Colors.amber, 
      surface: Color(0xFFB5B6B6), 
      onSurface: Colors.amber, 
      error: Colors.red, 
      onError: Colors.red, 
      tertiary: Color(0xFFDBB3AD)),
      
    );

    // Tipo de tema (claro ou escuro)
    String _tipo = 'claro';

    // Função que muda o tema do app
    void _alterarTema(){ 
      if (_tema.colorScheme.brightness == Brightness.light) {
        setState(() {
          _tema = _temaEscuro;
          _tipo = 'escuro';
        });
      }

      else if(_tema.colorScheme.brightness == Brightness.dark){
        setState(() {
          _tema = _temaClaro;
          _tipo = 'claro';
        });
      }
    }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast app',
      theme: _tema,
      home: PaginaInicial(mudarTema: _alterarTema,  
      tipoTema: _tipo,),
    );
  }
}