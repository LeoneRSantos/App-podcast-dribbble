import 'package:flutter/material.dart';
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: cores.background,
      
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
    
          children: [
            Topo(),
          ],
        ),
      ),
    );
  }
}