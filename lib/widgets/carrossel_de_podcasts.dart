import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarroselDePodcasts extends StatelessWidget {
  CarroselDePodcasts({Key? key}) : super(key: key);

  List<String> _imagens = ['assets/images/a-deriva.jpg', 'assets/images/flow.jpg', 'assets/images/podpah.jpg'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder( 
        
      itemBuilder: (BuildContext context, int index, int realIndex) { 
        final _podcasts = _imagens[index];

        return _construirImagem(_podcasts, index);
       }, 
      itemCount: _imagens.length, 
      options: CarouselOptions( 
        height: 300.0, 
        autoPlay: true, 
        reverse: true, 
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        pageSnapping: false,
      ),),
    );
  }
}

Widget _construirImagem(String imagem, int indice) => Container( 
  margin: EdgeInsets.symmetric(horizontal: 10.0),
  child: Image.asset(imagem),
);


