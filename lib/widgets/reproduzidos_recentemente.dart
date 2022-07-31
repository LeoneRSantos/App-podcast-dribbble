import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class ReproduzidosRecentemente extends StatelessWidget {
  ReproduzidosRecentemente({Key? key}) : super(key: key);
  
  // Logo dos Podcasts
  String aDerivaImagem = 'assets/images/a-deriva.jpg';
  String flowImagem = 'assets/images/flow.jpg';
  String podPahImagem = 'assets/images/podpah.jpg';

  // Nomes dos podcasts
  String aDerivaNome = 'À Deriva podcast';
  String flowNome = 'Flow podcast';
  String podPahNome = 'Pod Pah podcast';
  
  // Lista de imagens
  late List<String> imagensPodcasts = [ 
    aDerivaImagem, flowImagem, podPahImagem, aDerivaImagem, flowImagem, podPahImagem,
  ];

  // Lista de Nomes (subtítulos)
  late List<String> nomesPodcasts = [ 
    aDerivaNome, flowNome, podPahNome, aDerivaNome, flowNome, podPahNome,
  ];

  // Lista de títulos
  List<String> titulosPodcasts = [ 
    'Caio Fábio (191) | À Deriva Podcast com Arthur Petry', 
    'FALCÃO 12 - Flow #74 🤝 @Flow Sport Club', 
    'MANO BROWN - Podpah #351',

    'Taryana Rocha (Psicoterapeuta) (129) | À Deriva Podcast com Arthur Petry',
    'BRUNO CORREA [+ RATO BORRACHUDO] - Flow #84',
    'WHINDERSSON NUNES - Podpah #316',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: imagensPodcasts.length,
      itemBuilder: (BuildContext context, int index) {
        
        return ComponentePlayer(
          imagem: imagensPodcasts[index], 
          titulo: titulosPodcasts[index], 
          nome: nomesPodcasts[index],);

      });
  }
}

class ComponentePlayer extends StatelessWidget {
  ComponentePlayer({Key? key, 
  required this.imagem, 
  required this.titulo, 
  required this.nome}) : super(key: key);

  final String imagem;
  final String titulo;
  final String nome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row( 
        children: [ 
          CircleAvatar( 
            radius: 25.0,
            backgroundImage: AssetImage(imagem),
          ),

          Expanded(
            child: ListTile( 
              style:ListTileStyle.list,
              title: Textos(conteudo: titulo, 
              cor: Theme.of(context).colorScheme.primary, 
              tamanho: 16.0),
              subtitle: Textos(conteudo: nome, 
              cor: Theme.of(context).colorScheme.secondary, 
              tamanho: 14.0),
            ),
          ), 

        Spacer(), 

        Container(
          decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all( 
                width: 1.0, 
                color: Theme.of(context).colorScheme.primary,
              )
            ),
          child: IconButton(onPressed: (){}, 
          icon: Icon(Icons.play_arrow, 
          color: Theme.of(context).colorScheme.onBackground,)),
        ),
      ],
    );
  }
}