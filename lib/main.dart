import 'package:flutter/material.dart';
import 'package:projetolista/cardwidget.dart';
import 'package:projetolista/model/pessoa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Lista para Widget",
      home: Tela1(),
    );
  }
}

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  List<Pessoa> lista = [
    Pessoa(nome: "Jean", idade: 21, sobrenome: "Nunes", cpf: "024.562.634-34"),
    Pessoa(
        nome: "Neymar", idade: 32, sobrenome: "Junior", cpf: "200.342.324-54"),
    Pessoa(
        nome: "Lionel", idade: 37, sobrenome: "Messi", cpf: "432.642.234-54"),
    Pessoa(
        nome: "Cristiano",
        idade: 39,
        sobrenome: "Ronaldo",
        cpf: "757.324.342-54"),
  ];

  void removerItem(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("App Lista para Widget"),
            backgroundColor: Colors.redAccent),
        body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Cardwidget(
              nome: lista[index].nome,
              sobrenome: lista[index].sobrenome,
              onRemove: ()=> removerItem(index),
            );
          },
        ));
  }
}
