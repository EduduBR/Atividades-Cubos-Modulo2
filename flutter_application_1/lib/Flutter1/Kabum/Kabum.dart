import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Flutter1/Kabum/KabumScreen.dart';

void main() => runApp(const Kabum());

class Kabum extends StatefulWidget {
  const Kabum({super.key});

  @override
  State<Kabum> createState() => _KabumState();
}
final controller = PageController();
class _KabumState extends State<Kabum> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: PageView( physics: const NeverScrollableScrollPhysics(),
            controller: controller,children: [KabumScreen1(),KabumScreen2(),KabumScreen3()],)),);
  }
}