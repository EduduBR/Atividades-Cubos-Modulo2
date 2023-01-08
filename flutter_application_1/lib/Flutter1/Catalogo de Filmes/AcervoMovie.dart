import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//Informações de cada filme
class Poster {
  String title;
  String imagem;
  double pop;
  String overview;
  Poster(
      {required this.title,
      required this.imagem,
      required this.pop,
      required this.overview});
}

//Codigos de filmes,acilitanto a maneira de adicionar mais filmes
const codMovie = [
  '436270',
  '76600',
  '736526',
  '505642',
  '315162',
  '361743',
  '899112',
  '675353',
  '982620',
  '550',
  '966220'
];

//Função loop que pega as informações necessárias
Future getInfoMovie() async {
  final picture = Dio();
  for (int i = 0; i < codMovie.length; i++) {
    final resultado = await picture.get(
        'https://api.themoviedb.org/3/movie/${codMovie[i]}?api_key=127daaec0c09ab44dff0ed55219f1591&language=pt-BR');
    if (resultado.statusCode == 200) {
      poster.add(Poster(
          title: resultado.data['title'],
          imagem:
              'https://image.tmdb.org/t/p/w500${resultado.data['poster_path']}',
          pop: resultado.data["popularity"],
          overview: resultado.data["overview"]));
    } else {
       throw Exception('Falha ao carregar dados...');
    }
  }
}

var poster = [];

class MovieCor {
  static const Color base = Color(0xFFFF7000);
  static const Color switch_ = Color(0XFF8D8B92);
  static const Color transparent = Color(0XFF0000 );
  static const Color dark = Color(0XFF22262c);
 
}
