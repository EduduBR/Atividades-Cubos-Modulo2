
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Erros/ErroScreen.dart';

void main() => runApp(const Error());

class Error extends StatefulWidget {
  const Error({super.key});
  @override
  State<Error> createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
 
    final controller1 = PageController();
    @override
    Widget build(BuildContext context) {
      return const MaterialApp(
        home: Scaffold(
          body:ErrorScreen1(), 
        ),
      );
    }
  }


