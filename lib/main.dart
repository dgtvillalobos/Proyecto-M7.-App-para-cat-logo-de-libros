import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto7/views/admin/add_name_page.dart';
import 'package:proyecto7/views/admin/home_page.dart';
import 'package:proyecto7/views/user/info_libro.dart';
import 'package:proyecto7/views/user/inicio.dart';
import 'package:proyecto7/views/user/lista_libros.dart';
import 'package:proyecto7/views/admin/update_name_page.dart';
import 'services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => const Inicio(),
        '/': (context) => const Home(),
        '/add': (context) => const AddNamePage(),
        '/update': (context) => const UpdateNamePage(),
        '/listaLibros': (context) => const ListaLibros(),
        '/infoLibro': (context) => const InfoLibro(),
      },
    );
  }
}
