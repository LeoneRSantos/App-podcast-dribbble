import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/pages/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
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
          onSurface: Color(0xFF6E46D6), 
          error: Colors.red, 
          onError: Colors.red, 
          tertiary: Color(0xFFDBB3AD)),
        
      ),
      home: PaginaInicial(),
    );
  }
}


