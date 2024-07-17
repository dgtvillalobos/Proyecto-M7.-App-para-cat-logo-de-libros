import 'package:flutter/material.dart';
import 'package:proyecto7/services/firebase_service.dart';
import 'package:proyecto7/views/components/customNavigationBar.dart';

class ListaLibros extends StatefulWidget {
  const ListaLibros({super.key});

  @override
  State<ListaLibros> createState() => _ListaLibrosState();
}

class _ListaLibrosState extends State<ListaLibros> {
  Map<String, dynamic>? libroDelMes;
  List<dynamic> librosDisponibles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadLibros();
  }

  Future<void> loadLibros() async {
    final libroAzar = await getLibroAzar();
    final libros = await getLibros();
    setState(() {
      libroDelMes = libroAzar;
      librosDisponibles = libros;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagenes/backgroundLibros.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 25, 5),
                          child: Text(
                            'Libro del Mes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (libroDelMes != null) ...[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.pushNamed(
                                  context,
                                  '/infoLibro',
                                  arguments: {
                                    "uid": libroDelMes!['uid'],
                                    "Nombre": libroDelMes!['Nombre'],
                                    "Autor": libroDelMes!['Autor'],
                                    "Descripcion": libroDelMes!['Descripcion'],
                                    "Precio": libroDelMes!['Precio'],
                                    "RutaImg": libroDelMes!['RutaImg'],
                                  },
                                );
                                setState(() {});
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/imagenes/${libroDelMes!['RutaImg']}',
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${libroDelMes!['Nombre']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            "${libroDelMes!['Autor']}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 15),
                          const Divider(
                            color: Colors.white,
                            indent: 35,
                            endIndent: 35,
                          ),
                        ],
                        const Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 25, 5),
                          child: Text(
                            'Libros disponibles',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: librosDisponibles.length,
                          itemBuilder: (context, index) {
                            final libro = librosDisponibles[index];
                            return GestureDetector(
                              onTap: () async {
                                await Navigator.pushNamed(
                                  context,
                                  '/infoLibro',
                                  arguments: {
                                    "uid": libro['uid'],
                                    "Nombre": libro['Nombre'],
                                    "Autor": libro['Autor'],
                                    "Descripcion": libro['Descripcion'],
                                    "Precio": libro['Precio'],
                                    "RutaImg": libro['RutaImg'],
                                  },
                                );
                                setState(() {});
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                child: Card(
                                  elevation: 3,
                                  color: Colors.blueGrey.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.asset(
                                                'assets/imagenes/${libro['RutaImg']}',
                                                fit: BoxFit.cover,
                                                height: 120,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${libro['Nombre']}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  Text(
                                                    "${libro['Autor']}",
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    "${libro['Descripcion']}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
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
    );
  }
}
