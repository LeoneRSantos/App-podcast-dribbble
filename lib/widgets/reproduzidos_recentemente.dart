import 'package:flutter/material.dart';
import 'package:podcast_app_dribbble/pages/player.dart';
import 'package:podcast_app_dribbble/widgets/textos.dart';

class ReproduzidosRecentemente extends StatelessWidget {
  ReproduzidosRecentemente({Key? key}) : super(key: key);
  
  // Logo dos Podcasts
  String _aDerivaImagem = 'assets/images/a-deriva.jpg';
  String _flowImagem = 'assets/images/flow.jpg';
  String _podPahImagem = 'assets/images/podpah.jpg';

  // Nomes dos podcasts
  String _aDerivaNome = 'À Deriva podcast';
  String _flowNome = 'Flow podcast';
  String _podPahNome = 'Pod Pah podcast';
  
  // Lista de imagens
  late List<String> _imagensPodcasts = [ 
    _aDerivaImagem, _flowImagem, _podPahImagem, _aDerivaImagem, _flowImagem, _podPahImagem,
  ];

  // Lista de Nomes (subtítulos)
  late List<String> _nomesPodcasts = [ 
    _aDerivaNome, _flowNome, _podPahNome, _aDerivaNome, _flowNome, _podPahNome,
  ];

  // Lista de títulos
  List<String> _titulosPodcasts = [ 
    'Caio Fábio (191) | À Deriva Podcast com Arthur Petry', 
    'FALCÃO 12 - Flow #74 🤝 @Flow Sport Club', 
    'MANO BROWN - Podpah #351',

    'Taryana Rocha (Psicoterapeuta) (129) | À Deriva Podcast com Arthur Petry',
    'BRUNO CORREA [+ RATO BORRACHUDO] - Flow #84',
    'WHINDERSSON NUNES - Podpah #316',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Textos(conteudo: 'Reproduzidos recentemente', 
          cor: Theme.of(context).colorScheme.primary, 
          tamanho: 20.0),
        ),

        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _imagensPodcasts.length,
          itemBuilder: (BuildContext context, int index) {
            
            return ComponentePlayer(
              imagem: _imagensPodcasts[index], 
              titulo: _titulosPodcasts[index], 
              nome: _nomesPodcasts[index], 
              logoDosPodcasts: _imagensPodcasts, 
              tituloDosPodcasts: _titulosPodcasts, 
              indice: index,);

          }),
      ],
    );
  }
}

class ComponentePlayer extends StatelessWidget {
  ComponentePlayer({Key? key, 
  required this.imagem, 
  required this.titulo, 
  required this.nome, 
  required this.logoDosPodcasts, 
  required this.tituloDosPodcasts, 
  required this.indice}) : super(key: key);

  final String imagem;
  final String titulo;
  final String nome;
  final List<String> logoDosPodcasts;
  final List<String> tituloDosPodcasts;
  final int indice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),


      child: GestureDetector(
        // Função que redireciona para a segunda tela
        onTap: (){ 
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
          Player( 
            imagemPlayer: imagem,  
            tituloPlayer: titulo, 
            listaDeImagens: logoDosPodcasts, 
            listaDeTitulos: tituloDosPodcasts, 
            indiceDoComponente: indice,)),);
        },

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
      
            Container(
              decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all( 
                    width: 1.0, 
                    color: Theme.of(context).colorScheme.secondary,
                  )
                ),
              child: IconButton(onPressed: (){ 
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Player(
                    imagemPlayer: imagem, 
                    tituloPlayer: titulo, 
                    listaDeImagens: logoDosPodcasts, 
                    listaDeTitulos: tituloDosPodcasts, indiceDoComponente: indice,)),);
              }, 
              icon: Icon(Icons.play_arrow, 
              color: Theme.of(context).colorScheme.onBackground,)),
            ),
          ],
        ),
      ),
    );
  }
}