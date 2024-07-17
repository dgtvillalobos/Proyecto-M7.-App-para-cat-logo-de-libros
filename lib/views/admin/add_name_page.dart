import "package:flutter/material.dart";
import "package:proyecto7/services/firebase_service.dart";
import 'package:flutter/services.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController autorController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController nombreLibroController = TextEditingController(text: "");
  TextEditingController precioController = TextEditingController(text: "");
  bool disponibleController = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Libro'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
          child: TextField(
            controller: autorController,
            decoration: const InputDecoration(
              hintText: 'Ingrese el nombre del autor',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
          child: TextField(
            controller: nombreLibroController,
            decoration: const InputDecoration(
              hintText: 'Ingrese el nombre del libro',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
          child: TextField(
            controller: descripcionController,
            decoration: const InputDecoration(
              hintText: 'Ingrese una breve descripcion',
            ),
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
          child: TextField(
            controller: precioController,
            decoration: const InputDecoration(
              hintText: 'Ingrese el precio',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 5, 5),
              child: Text('Disponible'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Switch(
                value: disponibleController,
                onChanged: (bool nuevoValor) {
                  setState(() {
                    disponibleController = nuevoValor;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () async {
              await crearLibro(
                      autorController.text,
                      descripcionController.text,
                      nombreLibroController.text,
                      int.tryParse(precioController.text) ?? 0,
                      disponibleController)
                  .then((value) {
                Navigator.pop(context);
              });
            },
            child: const Text("Guardar"))
      ]),
    );
  }
}
