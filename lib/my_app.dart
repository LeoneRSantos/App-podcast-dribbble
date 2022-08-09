import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/pages/pagina_inicial.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: _temaEscuro,
      home: PaginaInicial(),
    );
  }
}