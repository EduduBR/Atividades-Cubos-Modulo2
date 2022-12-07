import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'Kabum.dart';

String gifBomba =
    'https://i.pinimg.com/originals/97/00/ff/9700ff5255003108cbb1c7b49e666637.gif';
String gifExplosao =
    'https://opengameart.org/sites/default/files/explosion1.gif';

var count = 0;
late Timer _contagem;

void kabumSorteio() {
  var intValue = Random().nextInt(60) + 1;
  count = intValue;
  print(intValue);
  _contagem = Timer.periodic(const Duration(seconds: 1), (timer) {
    count--;
    switch (count) {
      case 0:
        _contagem.cancel();
        controller.nextPage(
            duration: const Duration(microseconds: 300), curve: Curves.ease);
    }
  });
}

class KabumScreen1 extends StatelessWidget {
  const KabumScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Corra da bomba',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 100, 30, 0),
                width: 200,
                height: 60,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Curves.ease);
                    kabumSorteio();
                  },
                  child: const Text(
                    'Iniciar',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KabumScreen2 extends StatelessWidget {
  const KabumScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(20),
                child: Image.network(gifBomba)),
            const Text(
              'Passe a bomba',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      )),
    );
  }
}

class KabumScreen3 extends StatelessWidget {
  const KabumScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Você Perdeu!!!',
              style: TextStyle(fontSize: 30),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: Image.network(gifExplosao)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 100, 30, 10),
              width: 200,
              height: 60,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                onPressed: () {
                  controller.jumpToPage(0);
                },
                child: const Text(
                  'Voltar',
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
