import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proyecto7/services/firebase_service.dart';
import 'package:proyecto7/views/components/carrucel.dart';
import 'package:proyecto7/views/components/customNavigationBar.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Colors.orangeAccent,
        ),
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 120,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Text(
                  "Admin",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                color: Colors.orange,
                endIndent: 20,
                indent: 20,
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Agregar Libro'),
                onTap: () {
                  Navigator.pushNamed(context, "/add");
                },
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Lista Libros / Eliminar'),
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_box),
                title: const Text('Agregar Libros Automatico'),
                onTap: () {
                  agregarLibrosAutomatico();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_rounded),
                title: const Text('Eliminar Todos los libros'),
                onTap: () {
                  eliminarTodo();
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagenes/backgroundLibros.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "LIBROS-APP",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        "DISFRUTA DE LA LECTURA",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(height: 20),
                      CarouselLibrosAzar(),
                      SizedBox(height: 40),
                      Text(
                        "¿Qué deseas leer?",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          "Para disfrutar el placer de leer, lo más importante es elegir libros que te gusten, que te interesen y que te diviertan. No importa el género, el tema o el autor, lo que importa es que te enganches con la historia y los personajes, que te identifiques con ellos y que sientas emociones al leer.",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, "/inicio");
                break;
              case 1:
                Navigator.pushNamed(context, "/listaLibros");
                break;
            }
          },
        ),
      ),
    );
  }
}
