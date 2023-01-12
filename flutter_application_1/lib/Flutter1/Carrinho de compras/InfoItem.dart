import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/BuyAcervo.dart';
import 'package:flutter_application_1/Flutter1/Carrinho%20de%20compras/GridItens.dart';

class Item extends StatelessWidget {
  const Item({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Cor.baseClara,
      child: Stack(children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.network(
                pictureselected,
                height: 300,
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
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                textAlign: TextAlign.center,
                nameselected,
                style: const TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const Icon(Icons.star, color: Colors.amber),
                  const Icon(Icons.star, color: Colors.amber),
                  const Icon(Icons.star, color: Colors.amber),
                  const Icon(Icons.star, color: Colors.amber),
                  Text('(avaliado por especialistas)',
                      style: TextStyle(color: Colors.grey[700]))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Em estoque',
                          style: TextStyle(
                              color: Cor.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      Divider(thickness: 3, color: Cor.base)
                    ])),
            const Divider(thickness: 3, color: Cor.base),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'R\$${valorseleted.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 50,
                          color: Cor.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'ou 4x de R\$${(valorseleted / 4).toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        onPressed: () {
                          addItem(selected);
                        },
                        style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: Cor.base,
                            backgroundColor: Cor.base,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 3, color: Cor.green),
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Adicionar ao Carrinho',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: IconButton(
            onPressed: () => back(),
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        )
      ]),
    ));
  }
}
