import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

var errorstatus = true;

final userList = [
  'assets/user1.json',
  'assets/user2.json',
  'assets/user3.json',
  'assets/user4.json',
  'assets/user5.json',
  'assets/user6.json'
];

Future<String> userTreatment() async {
  var intValue = Random().nextInt(userList.length); //Sorteio
  var userinfo =
      await rootBundle.loadString(userList[intValue]); //Pegando dados json
  var data = jsonDecode(userinfo); // Processando dados
  var username = data["nome"].toString();
  var userbirthday = data["nascimento"].toString();
  if (userbirthday.length != 10) {
    throw 'Formato de data ano-mês-dia';
  }
  return 'Nome: $username \nAniversario: $userbirthday'; //mensagem
}

class ErrorScreen1 extends StatefulWidget {
  const ErrorScreen1({super.key});

  @override
  State<ErrorScreen1> createState() => _ErrorScreen1State();
}

class _ErrorScreen1State extends State<ErrorScreen1> {
  // Timer de 5 segundos
  Future<String> errorTimer() {
    return Future<String>.delayed(
      const Duration(seconds: 5),
      () => userTreatment(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: errorstatus
            ? Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 30, 0),
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    onPressed: () async {
                      setState(() {
                        errorstatus = false;
                      });
                    },
                    child: const Text(
                      'Clique aqui',
                    ),
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<String>(
                      future: errorTimer(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        List<Widget> children;
                        if (snapshot.hasData) {
                          children = <Widget>[
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                '${snapshot.data}',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ];
                        } else if (snapshot.hasError) {
                          children = <Widget>[
                            const Icon(
                              Icons.error_outlined,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Erro: ${snapshot.error}'),
                            ),
                          ];
                        } else {
                          children = const <Widget>[
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Carregando...'),
                            ),
                          ];
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: children,
                          ),
                        );
                      },
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
                          setState(() {
                            errorstatus = true;
                          });
                        },
                        child: const Text('Voltar'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
