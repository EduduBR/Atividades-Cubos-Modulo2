import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/Imagens.dart';
import 'GridItens.dart';
import 'PetMatrizApp.dart';

var pictureselected = '';
double valorseleted = 0;
var nameselected = '';
var selected = 0;

class Products {
  String title;
  String imagem;
  double preco;
  Products({
    required this.title,
    required this.imagem,
    required this.preco,
  });
}

final productsList = [
  Products(title: titleProduct[0], imagem: dogPicture[0], preco: 160.00),
  Products(title: titleProduct[1], imagem: dogPicture[1], preco: 150.90),
  Products(title: titleProduct[2], imagem: dogPicture[2], preco: 145.90),
  Products(title: titleProduct[3], imagem: dogPicture[3], preco: 180.88),
  Products(title: titleProduct[4], imagem: dogPicture[4], preco: 130.50),
  Products(title: titleProduct[5], imagem: dogPicture[5], preco: 120.00),
  Products(title: titleProduct[6], imagem: dogPicture[6], preco: 135.00),
  Products(title: titleProduct[7], imagem: dogPicture[7], preco: 140.00),
  Products(title: titleProduct[8], imagem: dogPicture[8], preco: 135.00),
  Products(title: titleProduct[9], imagem: dogPicture[9], preco: 162.11),
  Products(title: titleProduct[10], imagem: dogPicture[10], preco: 180.07),
  Products(title: titleProduct[11], imagem: dogPicture[11], preco: 145.00),
  Products(title: titleProduct[12], imagem: dogPicture[12], preco: 133.00),
  Products(title: titleProduct[13], imagem: dogPicture[13], preco: 100.00),
  Products(title: titleProduct[14], imagem: dogPicture[14], preco: 1339.99),
  Products(title: titleProduct[15], imagem: dogPicture[15], preco: 539.99),
  Products(title: titleProduct[16], imagem: dogPicture[16], preco: 263.99),
  Products(title: titleProduct[17], imagem: dogPicture[17], preco: 1097.90),
  Products(title: titleProduct[18], imagem: dogPicture[18], preco: 39.00),
  Products(title: titleProduct[19], imagem: dogPicture[19], preco: 5.00),
  Products(title: titleProduct[20], imagem: dogPicture[20], preco: 30.50),
  Products(title: titleProduct[21], imagem: dogPicture[21], preco: 25.08),
  Products(title: titleProduct[22], imagem: dogPicture[22], preco: 45.00),
  Products(title: titleProduct[23], imagem: dogPicture[23], preco: 25),
  Products(title: titleProduct[24], imagem: dogPicture[24], preco: 45.00),
  Products(title: titleProduct[25], imagem: dogPicture[25], preco: 25.00),
  Products(title: titleProduct[26], imagem: dogPicture[26], preco: 30.00),
  Products(title: titleProduct[27], imagem: dogPicture[27], preco: 35.00),
  Products(title: titleProduct[28], imagem: dogPicture[28], preco: 45.00),
  Products(title: titleProduct[29], imagem: dogPicture[29], preco: 45.00),
];

final produtcat = [
  Products(title: infocat[0], imagem: catPicture[0], preco: 60),
  Products(title: infocat[1], imagem: catPicture[1], preco: 48),
  Products(title: infocat[2], imagem: catPicture[2], preco: 32),
  Products(title: infocat[3], imagem: catPicture[3], preco: 29),
  Products(title: infocat[4], imagem: catPicture[4], preco: 47),
  Products(title: infocat[5], imagem: catPicture[5], preco: 80),
  Products(title: infocat[6], imagem: catPicture[6], preco: 50),
  Products(title: infocat[7], imagem: catPicture[7], preco: 30),
  Products(title: infocat[8], imagem: catPicture[8], preco: 180),
  Products(title: infocat[9], imagem: catPicture[9], preco: 200)
];

final itens = [];

void next() {
  controller.nextPage(
      duration: const Duration(microseconds: 300), curve: Curves.ease);
}

class Cor {
  static const Color base = Color(0xFF8fdf7a);
  static Color baseClara = Colors.green.shade50;
  static const Color green = Color(0XFF028001);
  static const Color red = Color(0XFFd1052a);
}

void back() {
  controller.previousPage(
      duration: const Duration(microseconds: 120), curve: Curves.ease);
  selected = 0;
  pictureselected = '';
  nameselected = '';
  valorseleted = 0;
}

class Logo {
  static const String dog =
      'https://cdn-icons-png.flaticon.com/512/6616/6616230.png';
  static const String cat =
      'https://cdn-icons-png.flaticon.com/512/9340/9340415.png';
}

final carrinho = [];

