import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/estrutura_app_bar.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class Configuracoes extends StatefulWidget {
  Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  // Valor utilizado no switch
  bool _valor = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold( 
        backgroundColor: Theme.of(context).colorScheme.background,
        
        appBar: AppBar( 
          backgroundColor: Theme.of(context).colorScheme.background, 
          elevation: 0.0,
          title: const EstruturaAppBar( 
            texto: 'Configurações',  
            icone: Icons.settings),
        ),


        body: Column( 
          children: [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all( 
                  width: 1.0, 
                  color: Theme.of(context).colorScheme.secondary,
                  ),
                ), 

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [ 
                      Textos( 
                        conteudo: 'Tema\t',  
                        cor: Theme.of(context).colorScheme.primary, tamanho: 20.0),

                        Textos( 
                        conteudo: 'tema claro',  
                        cor: Theme.of(context).colorScheme.secondary, tamanho: 20.0), 

                        const Spacer(), 

                        Switch( 
                          activeColor: Theme.of(context).colorScheme.secondary,
                          inactiveThumbColor: Theme.of(context).colorScheme.background,
                          value: _valor,  
                          onChanged: (bool valorAtual){ 
                            setState(() {
                              _valor = valorAtual;
                              
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ), 
      );
  }
}