import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Catalogo%20de%20Filmes/AcervoMovie.dart';
import 'package:flutter_application_1/Flutter1/Catalogo%20de%20Filmes/MovieList.dart';
import 'Catalogo.dart';
import 'matrix.dart';

var imagem = '';
var sinopse = '';
var title = '';

void movieBack() {
  moviecontroller.previousPage(
      duration: const Duration(microseconds: 300), curve: Curves.ease);
}

class MovieSnopse extends StatefulWidget {
  const MovieSnopse({super.key});

  @override
  State<MovieSnopse> createState() => _MovieSnopseState();
}

class _MovieSnopseState extends State<MovieSnopse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isSwitched ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              ListView(
                children: [
                  Image.network(imagem),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                            )),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: const Text(
                            'Sinopse',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(sinopse, style: const TextStyle(fontSize: 25))
                      ],
                    ),
                  ),
                ],
              ),
              const IconButton(
                onPressed: movieBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: MovieCor.base,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
