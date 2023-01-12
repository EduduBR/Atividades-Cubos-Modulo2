import 'dart:async';

import 'package:flutter/material.dart';
import 'BuyAcervo.dart' as conteudo;
import 'BuyAcervo.dart';
import 'PetMatrizApp.dart';
import 'Widget.dart';

final productsData = List<Products>.from(conteudo.productsList);
final productsCat = List<Products>.from(conteudo.produtcat);


double counter = 0;

Stream<double> calculater() async* {
  counter = 0;
  for (int i = 0; i < carrinho.length; i++) {
    var info = carrinho[i];
    counter += info.preco;
    yield counter;
  }
}

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 30,
      padding: const EdgeInsets.all(5.0),
      shrinkWrap: true,
      childAspectRatio: (100 / 150),
      children: List.generate(
        productsList.length,
        (index) {
          var info = productsList[index];
          return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                  pictureselected = info.imagem;
                  nameselected = info.title;
                  valorseleted = info.preco;
                  next();
                });
              },
              child: InfoItem(
                picture: info.imagem,
                valor: info.preco,
                name: info.title,
                height: 100,
                width: 100,
              ));
        },
      ),
    );
  }
}

class Storecat extends StatefulWidget {
  const Storecat({super.key});

  @override
  State<Storecat> createState() => _StorecatState();
}

class _StorecatState extends State<Storecat> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 30,
      padding: const EdgeInsets.all(5.0),
      shrinkWrap: true,
      childAspectRatio: (100 / 150),
      children: List.generate(
        productsCat.length,
        (index) {
          var info = productsCat[index];
          return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                  pictureselected = info.imagem;
                  nameselected = info.title;
                  valorseleted = info.preco;
                  next();
                });
              },
              child: InfoItem(
                picture: info.imagem,
                valor: info.preco,
                name: info.title,
                height: 100,
                width: 100,
              ));
        },
      ),
    );
  }
}







class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Cor.base,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.jumpTo(1);
          },
        ),
      ),
      body: Container(
        color: Cor.baseClara,
        child: StreamBuilder<Object>(
            stream: calculater(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: ((context, index) =>
                            const SizedBox(height: 5)),
                        itemCount: carrinho.length,
                        itemBuilder: ((context, index) {
                          var info = carrinho[index];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            height: 70,
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Image.network(
                                    info.imagem,
                                    height: 60,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 60,
                                  child: Text(
                                    info.title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        removeItem(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Cor.red,
                                    ))
                              ],
                            ),
                          );
                        })),
                  ),
                  Totale(texto: 'R\$${counter.toStringAsFixed(2)}')
                ],
              );
            }),
      ),
    );
  }
}

void addItem(int index) {
  carrinho.add(productsList[selected]);
  NotificationListener;
}

void removeItem(int index) {
  carrinho.removeAt(index);
  NotificationListener;
}

