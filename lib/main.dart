import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: '-OC Pajaro Medium',
        colorScheme: ColorScheme( 
          brightness: Brightness.light, 
          primary: Color(0xFF050507), 
          secondary: Color(0xFFB5B6B6), 
          onPrimary: Color(0xFFEB672B), 
          onSecondary: Color(0xFF424153), 
          background: Color(0xFFE4E5E6), 
          onBackground: Color(0xFFF1A060), 
          surface: Color(0xFFB5B6B6), 
          onSurface: Color(0xFF6E46D6), 
          error: Colors.red, 
          onError: Colors.red, 
          tertiary: Color(0xFFDBB3AD)),
        
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
  
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
  
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
        ],
      ),
    );
  }
}
