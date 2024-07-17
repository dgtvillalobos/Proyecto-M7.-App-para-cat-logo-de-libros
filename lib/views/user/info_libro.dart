import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto7/services/firebase_service.dart';
import 'package:intl/intl.dart';
import 'package:proyecto7/views/components/customNavigationBar.dart';

class InfoLibro extends StatefulWidget {
  const InfoLibro({super.key});

  @override
  State<InfoLibro> createState() => _InfoLibroState();
}

class _InfoLibroState extends State<InfoLibro> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController autorController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController rutaImgController = TextEditingController(text: "");

  String precioController = "";

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    rutaImgController.text = arguments['RutaImg'];

    nameController.text = arguments['Nombre'];
    autorController.text = arguments['Autor'];
    descripcionController.text = arguments['Descripcion'];
    precioController = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 0,
    ).format(arguments['Precio']);

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            Navigator.pop(context);
          }
        },
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/imagenes/${rutaImgController.text}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(
                                    0.5), // color del degradado con opacidad
                                Colors.white
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SizedBox(
                              height: 230,
                              child: Image.asset(
                                'assets/imagenes/${rutaImgController.text}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  nameController.text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  autorController.text,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.blueGrey,
                                padding: const EdgeInsets.all(5.0),
                                child: const Text(
                                  'Calificación',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.white,
                                padding: const EdgeInsets.all(5.0),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '4.5/5',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.blueGrey,
                                padding: const EdgeInsets.all(5.0),
                                child: const Text(
                                  'Paginas',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.white,
                                padding: const EdgeInsets.all(5.0),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.library_books,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '140',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.blueGrey,
                                padding: const EdgeInsets.all(5.0),
                                child: const Text(
                                  'Idioma',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                color: Colors.white,
                                padding: const EdgeInsets.all(5.0),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'SPA',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 179, 139, 11), // Color de fondo del botón
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50), // Padding del botón
                          ),
                          child: Text(
                            'Comprar: ${precioController.replaceAll(',', '.')}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Descripción",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 20),
                  child: Text(
                    descripcionController.text,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 15, 0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('Atrás'),
        ),
      ),
    );
  }
}
