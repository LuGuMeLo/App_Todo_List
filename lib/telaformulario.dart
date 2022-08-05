import 'package:flutter/material.dart';

class Telaformulario extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  Telaformulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'O campo é obrigatório';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Tarefa',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState?.validate() == true) {
                      Navigator.of(context).pop(_controller.text);
                    }
                  },
                  child: const Text('Salvar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
