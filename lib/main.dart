import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetolista/model/pessoa.dart';
import 'package:projetolista/cardwidget.dart';

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

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();

  void openModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Text(
                    "Digite as informações necessárias",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(label: Text("Nome")),
                  ),
                  TextField(
                    controller: sobrenomeController,
                    decoration: InputDecoration(label: Text("Sobrenome")),
                  ),
                  TextField(
                    controller: idadeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      label: Text("Idade"),
                    ),
                  ),
                  TextField(
                    controller: cpfController,
                    decoration: InputDecoration(
                      label: Text("CPF"),
                    ),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueAccent),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          minimumSize: WidgetStatePropertyAll(Size(300, 50))),
                      onPressed: () {
                        setState(() {
                          lista.add(Pessoa(
                              nome: nomeController.text,
                              idade: int.parse(idadeController.text),
                              sobrenome: sobrenomeController.text,
                              cpf: cpfController.text));
                        });
                        Navigator.pop(context);
                        nomeController.clear();
                        sobrenomeController.clear();
                        idadeController.clear();
                        cpfController.clear();
                      },
                      child: Text("Cadastrar")),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Lista para Widget",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Cardwidget(
            nome: lista[index].nome,
            sobrenome: lista[index].sobrenome,
            onRemove: () => removerItem(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModal();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
