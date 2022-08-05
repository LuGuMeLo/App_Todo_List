import 'package:app_todo/telaformulario.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> itens = [];
  // ignore: prefer_typing_uninitialized_variables
  var index;

  void adicionarItem(value) {
    itens.add(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/telaformulario', arguments: Telaformulario())
              .then(
            (value) {
              if (value != null) {
                setState(() {
                  adicionarItem(value);
                });
              }
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(
                    '${index + 1} - ${itens[index]}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
