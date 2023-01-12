import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/BuyAcervo.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/GridItens.dart';
import 'PetMatrizApp.dart';

final buyController = PageController();

class TabStore extends StatelessWidget {
  const TabStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.jumpToPage(2);
            },
            backgroundColor: Cor.red,
            child: const Icon(Icons.shopping_cart),
          ),
          appBar: AppBar(
              backgroundColor: Cor.base,
              title: const Text("PetShop",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              bottom: TabBar(
                  indicatorWeight: 2,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.red,
                  tabs: [
                    Image.network(Logo.dog, scale: 10),
                    Image.network(Logo.cat, scale: 10)
                  ])),
          body: Container(
            color: Cor.baseClara,
            child: Column(
              children: const [
                Expanded(
                    child: TabBarView(
                  children: [Store(),Storecat()],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
