import 'package:flutter/material.dart';

import 'BuyAcervo.dart';

class InfoItem extends StatelessWidget {
  final String picture;
  final double valor;
  final String name;
  final double height;
  final double width;

  const InfoItem(
      {super.key,
      required this.picture,
      required this.valor,
      required this.name,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Cor.base, width: 3),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Center(
          child: Column(
        children: [
          Image.network(
            picture,
            height: 150,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name,
                style: const TextStyle(fontSize: 13, color: Colors.black)),
          ),
          const Spacer(),
          const Divider(
            color: Cor.base,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('R\$${valor.toStringAsFixed(2)}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          )
        ],
      )),
    );
  }
}

class Totale extends StatelessWidget {
  final texto;

  const Totale({super.key, required this.texto});
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 300,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Cor.green),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Valor Total',
                  style: TextStyle(color: Cor.baseClara),
                ),
                Text(
                  texto,
                  style: TextStyle(
                      fontSize: 25,
                      color: Cor.baseClara,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  Text('Pague agora',
                      style: TextStyle(
                          fontSize: 15,
                          color: Cor.baseClara,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.navigate_next_outlined,
                    color: Cor.baseClara,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
