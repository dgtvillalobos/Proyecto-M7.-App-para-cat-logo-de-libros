import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proyecto7/services/firebase_service.dart';

class CarouselLibrosAzar extends StatefulWidget {
  const CarouselLibrosAzar({Key? key}) : super(key: key);

  @override
  _CarouselLibrosAzarState createState() => _CarouselLibrosAzarState();
}

class _CarouselLibrosAzarState extends State<CarouselLibrosAzar> {
  List<Map<String, dynamic>> librosAzar = [];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    loadLibrosAzar();
  }

  Future<void> loadLibrosAzar() async {
    try {
      final List<Map<String, dynamic>> libros = await getLibrosAzar(3);
      setState(() {
        librosAzar = libros;
      });
    } catch (e) {
      print('Error cargando libros al azar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return librosAzar.isNotEmpty
        ? Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 270,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: librosAzar.map((libro) {
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/imagenes/${libro['RutaImg']}',
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: librosAzar.map((libro) {
                  int index = librosAzar.indexOf(libro);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _current == index ? Colors.blueAccent : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
