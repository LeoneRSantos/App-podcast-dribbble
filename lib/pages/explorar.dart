import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class Explorar extends StatefulWidget {
  const Explorar({Key? key}) : super(key: key);

  @override
  State<Explorar> createState() => _ExplorarState();
}

class _ExplorarState extends State<Explorar> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar( 
        title: Textos(
          conteudo: 'Explore novos podcasts', 
          cor: Theme.of(context).colorScheme.primary, 
          tamanho: 26.0),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.primary,
                iconColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.search_outlined, 
                size: 30.0,),
                border: const OutlineInputBorder(),
                labelText: 'Explorar',
              ),
              controller: _controller,
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Textos( 
                        conteudo: 'Ocorreu um erro',  
                        cor: Theme.of(context).colorScheme.primary, tamanho: 20.0),

                      content:Textos( 
                        conteudo: 'Por favor, tente novamente mais tarde.', 
                        cor: Theme.of(context).colorScheme.primary, tamanho: 20.0),

                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Textos(
                            conteudo: 'OK', 
                            cor: Theme.of(context).colorScheme.primary, 
                            tamanho: 20.0),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}