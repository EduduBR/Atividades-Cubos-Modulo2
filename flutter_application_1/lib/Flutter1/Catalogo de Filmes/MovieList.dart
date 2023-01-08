import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Catalogo%20de%20Filmes/AcervoMovie.dart'
    as conteudo;
import 'Sinopse.dart';
import 'AcervoMovie.dart';
import 'matrix.dart';

final posterContents = List<Poster>.from(conteudo.poster);

dynamic alfabetica() {
  posterContents.sort((a, b) => a.title.compareTo(b.title));
}

dynamic popularity() {
  posterContents.sort((a, b) => b.pop.compareTo(a.pop));
}

void next() {
  moviecontroller.nextPage(
      duration: const Duration(microseconds: 300), curve: Curves.ease);
}

var selectedMovie = 0;

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    movieDataI = getInfoMovie();
  }

  late Future movieDataI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: movieDataI,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (poster.isEmpty == false) {
                return Builder(ordem: alfabetica());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_sharp,
                      color: Colors.red[700],
                      size: 100,
                    ),
                    const Text("   Erro no Processo\nVerifique sua conexão"),
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class MoviePopList extends StatefulWidget {
  const MoviePopList({super.key});

  @override
  State<MoviePopList> createState() => _MoviePopListState();
}

class _MoviePopListState extends State<MoviePopList> {
  @override
  void initState() {
    super.initState();
    movieDataII = getInfoMovie();
  }

  late Future movieDataII;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: movieDataII,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (poster.isEmpty == false) {
                return Builder(ordem: popularity());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_sharp,
                      color: Colors.red[700],
                      size: 100,
                    ),
                    const Text("   Erro no Processo\nVerifique sua conexão"),
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return const Text('Erro no processo');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class Builder extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ordem;
  const Builder({super.key, required this.ordem});

  @override
  State<Builder> createState() => _BuilderState();
}

class _BuilderState extends State<Builder> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 30,
      padding: const EdgeInsets.all(5.0),
      shrinkWrap: true,
      childAspectRatio: (100 / 200),
      children: List.generate(
        codMovie.length,
        (index) {
          widget.ordem;
          var button = posterContents[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                next();
                selectedMovie = index;
                imagem = button.imagem;
                sinopse = button.overview;
                title = button.title;
              });
            },
            child: Column(
              children: [
                Image.network(
                  button.imagem,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                Text(button.title, style: const TextStyle(fontSize: 15))
              ],
            ),
          );
        },
      ),
    );
  }
}
