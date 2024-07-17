import "package:flutter/material.dart";
import "package:proyecto7/services/firebase_service.dart";

class UpdateNamePage extends StatefulWidget {
  const UpdateNamePage({super.key});

  @override
  State<UpdateNamePage> createState() => _UpdateNamePageState();
}

class _UpdateNamePageState extends State<UpdateNamePage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    nameController.text = arguments['Nombre'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Name'),
      ),
      body: Column(children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Ingrese el nuevo nombre',
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              await updateLibro(arguments['uid'], nameController.text)
                  .then((value) {
                Navigator.pop(context);
              });
            },
            child: const Text("Actualizar"))
      ]),
    );
  }
}
