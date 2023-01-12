import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/GridItens.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/Tabs.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/InfoItem.dart';

void main() => runApp(const MatrizApp());

final controller = PageController();

class MatrizApp extends StatelessWidget {
  const MatrizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: const [TabStore(), Item(), ShoppingCart()]),
      ),
    );
  }
}
