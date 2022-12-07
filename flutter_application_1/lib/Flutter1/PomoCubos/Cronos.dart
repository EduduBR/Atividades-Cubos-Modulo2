import 'dart:async';
import 'package:flutter/material.dart';

Color pomoColor = Color(0xffEF0779);

void main() => runApp(const Cronos());

class Cronos extends StatefulWidget {
  const Cronos({super.key});

  @override
  State<Cronos> createState() => _CronosState();
}

class _CronosState extends State<Cronos> {
  //Variaveis
  String cronosStatus = 'Inativo';
  String buttonFuncion = 'Iniciar';
  var cronosSeconds = 0;
  var cronosMinuts = 25;
  bool buttonState = true;

  late Timer _timer;

  //start pomo
  void cronosStart() {
    buttonState = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      switch (cronosSeconds) {
        case 0:
          cronosMinuts--;
          cronosSeconds = 60;
          break;
      }
      cronosCount();
    });
  }

  //Restart pomo
  void cronosStop() {
    _timer.cancel();
    cronosStatus = 'Inativo';
    buttonFuncion = 'Iniciar';
    cronosSeconds = 0;
    cronosMinuts = 25;
    buttonState = true;
  }

  void cronosCount() {
    setState(() {
      cronosSeconds--;
      cronosStatus = 'Ativo';
      buttonFuncion = 'Parar';
      if (cronosMinuts == 0 && cronosSeconds == 0) {
        _timer.cancel();
        cronosStop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: pomoColor,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Text(
                "PomoCubos",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 200, 0, 25),
              child: Text(cronosStatus,
                  style: const TextStyle(color: Colors.white, fontSize: 25)),
            ),
            Text(
              '${cronosMinuts.toString().padLeft(2, '0')}:${cronosSeconds.toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.white, fontSize: 90),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              width: 250,
              height: 55,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                onPressed: (() {
                  setState(() {
                    buttonState ? cronosStart() : cronosStop();
                  });
                }),
                child: Text(buttonFuncion,
                    style: TextStyle(color: pomoColor, fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
