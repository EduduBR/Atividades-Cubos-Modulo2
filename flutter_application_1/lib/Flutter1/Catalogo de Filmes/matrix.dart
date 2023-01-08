
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Catalogo%20de%20Filmes/AcervoMovie.dart';
import 'package:flutter_application_1/Flutter1/Catalogo%20de%20Filmes/Catalogo.dart';
import 'package:flutter_application_1/Flutter1/Catalogo%20de%20Filmes/Sinopse.dart';

void main() => runApp(const MyMatrix());

class MyMatrix extends StatefulWidget {
  const MyMatrix({super.key});
  @override
  State<MyMatrix> createState() => _MyMatrixState();
}

final moviecontroller = PageController();

class _MyMatrixState extends State<MyMatrix> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 17,
          backgroundColor: MovieCor.base,
        ),
        body: PageView(
            controller: moviecontroller,
            children: const [Catalogo(), MovieSnopse()]),
      ),
    );
  }
}
