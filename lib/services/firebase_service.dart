import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getLibros() async {
  List libros = [];
  CollectionReference collectionReferenceLibros = db.collection('Libros');

  QuerySnapshot queryLibros = await collectionReferenceLibros.get();

  for (var doc in queryLibros.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final libro = {
      "Nombre": data['Nombre'],
      "uid": doc.id,
      "Autor": data['Autor'],
      "Descripcion": data['Descripcion'],
      "Precio": data['Precio'],
      "RutaImg": data['RutaImg']
    };
    libros.add(libro);
  }

  return libros;
}

Future<Map<String, dynamic>> getLibroAzar() async {
  List<Map<String, dynamic>> libros = [];
  CollectionReference collectionReferenceLibros = db.collection('Libros');

  QuerySnapshot queryLibros = await collectionReferenceLibros.get();

  for (var doc in queryLibros.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final libro = {
      "Nombre": data['Nombre'],
      "uid": doc.id,
      "Autor": data['Autor'],
      "Descripcion": data['Descripcion'],
      "Precio": data['Precio'],
      "RutaImg": data['RutaImg']
    };
    libros.add(libro);
  }

  if (libros.isNotEmpty) {
    final random = Random();
    return libros[random.nextInt(libros.length)];
  } else {
    throw Exception('No hay libros disponibles');
  }
}

Future<List<Map<String, dynamic>>> getLibrosAzar(int cantidad) async {
  List<Map<String, dynamic>> libros = [];
  CollectionReference collectionReferenceLibros =
      FirebaseFirestore.instance.collection('Libros');

  QuerySnapshot queryLibros = await collectionReferenceLibros.get();

  for (var doc in queryLibros.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final libro = {
      "Nombre": data['Nombre'],
      "uid": doc.id,
      "Autor": data['Autor'],
      "Descripcion": data['Descripcion'],
      "Precio": data['Precio'],
      "RutaImg": data['RutaImg']
    };
    libros.add(libro);
  }

  if (libros.isNotEmpty) {
    final random = Random();

    final List<Map<String, dynamic>> librosAlAzar = [];
    for (var i = 0; i < cantidad; i++) {
      librosAlAzar.add(libros[random.nextInt(libros.length)]);
    }
    return librosAlAzar;
  } else {
    throw Exception('No hay libros disponibles');
  }
}

Future<void> crearLibro(String autor, String descripcion, String nombreLibro,
    int precio, bool disponibleController) async {
  await db.collection("Libros").add({
    "Autor": autor,
    "Descripcion": descripcion,
    "Nombre": nombreLibro,
    "Precio": precio,
    "Disponible": disponibleController,
    "RutaImg": "sin.jpg"
  });
}

Future<void> updateLibro(String uid, String autor) async {
  await db.collection("Libros").doc(uid).set({"Autor": autor});
}

Future<void> deleteLibro(String uid) async {
  await db.collection("Libros").doc(uid).delete();
}

Future<void> eliminarTodo() async {
  final collection = db.collection("Libros");

  var snapshots = await collection.get();

  for (var doc in snapshots.docs) {
    await doc.reference.delete();
  }
}

Future<void> agregarLibrosAutomatico() async {
  final List<Map<String, dynamic>> libros = [
    {
      "autor": "Gabriel García Márquez",
      "descripcion":
          "Una obra maestra del realismo mágico que narra la historia de la familia Buendía a lo largo de varias generaciones en el ficticio pueblo de Macondo. Con un estilo narrativo único, García Márquez explora temas universales como el amor, la soledad y el destino.",
      "nombreLibro": "Cien años de soledad",
      "precio": 15000,
      "disponible": true,
      "rutaImg": "Cien_Anos.jpg"
    },
    {
      "autor": "Miguel de Cervantes",
      "descripcion":
          "Considerada la primera novela moderna, sigue las aventuras del caballero Don Quijote y su fiel escudero Sancho Panza por la España del siglo XVII. Cervantes mezcla humor, crítica social y profundidad psicológica en esta obra clásica.",
      "nombreLibro": "Don Quijote de la Mancha",
      "precio": 18000,
      "disponible": true,
      "rutaImg": "Don_Quijote.jpg"
    },
    {
      "autor": "Harper Lee",
      "descripcion":
          "Ambientada en la América profunda durante los años 30, esta novela sigue la historia de Scout Finch, una niña cuyo padre abogado defiende a un hombre negro acusado injustamente de violar a una mujer blanca. Explora temas de racismo, injusticia y moralidad.",
      "nombreLibro": "Matar a un ruiseñor",
      "precio": 12000,
      "disponible": true,
      "rutaImg": "matar.jpg"
    },
    {
      "autor": "George Orwell",
      "descripcion":
          "Una distopía futurista que presenta un mundo totalitario donde el gobierno controla cada aspecto de la vida de sus ciudadanos. Orwell reflexiona sobre el poder, la manipulación y la resistencia individual en una sociedad opresiva.",
      "nombreLibro": "1984",
      "precio": 16000,
      "disponible": true,
      "rutaImg": "1984.jpg"
    },
    {
      "autor": "Jane Austen",
      "descripcion":
          "Una comedia romántica que critica la sociedad inglesa del siglo XIX a través de la relación entre Elizabeth Bennet y el enigmático Sr. Darcy. Austen satiriza las normas sociales, el matrimonio por conveniencia y la búsqueda del verdadero amor.",
      "nombreLibro": "Orgullo y prejuicio",
      "precio": 14000,
      "disponible": true,
      "rutaImg": "orgullo.jpg"
    },
    {
      "autor": "F. Scott Fitzgerald",
      "descripcion":
          "Ambientada en la era del jazz de los años 20 en Nueva York, la novela sigue a Jay Gatsby, un misterioso millonario obsesionado con recuperar un amor del pasado. Fitzgerald explora la decadencia moral, la riqueza y la búsqueda del sueño americano.",
      "nombreLibro": "El gran Gatsby",
      "precio": 20000,
      "disponible": true,
      "rutaImg": "gran.jpg"
    },
    {
      "autor": "Gabriel García Márquez",
      "descripcion":
          "Basada en un hecho real, la novela relata el asesinato de Santiago Nasar a manos de los hermanos Vicario, a pesar de que toda la comunidad conoce el plan. García Márquez utiliza la estructura de la narrativa para explorar la fatalidad y la responsabilidad colectiva.",
      "nombreLibro": "Crónica de una muerte anunciada",
      "precio": 11000,
      "disponible": true,
      "rutaImg": "cronica.jpg"
    },
    {
      "autor": "Antoine de Saint-Exupéry",
      "descripcion":
          "Un cuento filosófico y poético que sigue las aventuras de un pequeño príncipe que visita diferentes planetas y aprende lecciones sobre la vida, el amor y la amistad. Saint-Exupéry aborda temas universales a través de metáforas simples y emotivas.",
      "nombreLibro": "El principito",
      "precio": 9000,
      "disponible": true,
      "rutaImg": "El_Principito.jpg"
    },
    {
      "autor": "León Tolstói",
      "descripcion":
          "Una novela épica que explora la compleja vida de Anna Karenina, una mujer casada que se enamora de un apuesto oficial. Tolstói analiza las convenciones sociales, el matrimonio y los conflictos emocionales en la Rusia del siglo XIX.",
      "nombreLibro": "Anna Karenina",
      "precio": 22000,
      "disponible": true,
      "rutaImg": "anna.jpg"
    },
    {
      "autor": "Fiódor Dostoyevski",
      "descripcion":
          "La historia de Rodion Raskólnikov, un estudiante pobre que comete un crimen por una teoría sobre la superioridad de ciertas personas. Dostoyevski explora el remordimiento, la redención y la moralidad en la sociedad rusa del siglo XIX.",
      "nombreLibro": "Crimen y castigo",
      "precio": 17000,
      "disponible": true,
      "rutaImg": "crimen.jpg"
    },
    {
      "autor": "Herman Melville",
      "descripcion":
          "Una novela épica que sigue al capitán Ahab en su obsesiva búsqueda de venganza contra Moby Dick, la ballena blanca que le arrancó una pierna. Melville explora temas como la obsesión, la naturaleza humana y el conflicto entre el hombre y la naturaleza.",
      "nombreLibro": "Moby Dick",
      "precio": 19000,
      "disponible": true,
      "rutaImg": "moby.jpg"
    },
    {
      "autor": "Marcel Proust",
      "descripcion":
          "Una extensa novela que reflexiona sobre la memoria, el tiempo y la identidad a través de la vida del narrador y sus recuerdos de la sociedad francesa de finales del siglo XIX y principios del XX.",
      "nombreLibro": "En busca del tiempo perdido",
      "precio": 25000,
      "disponible": true,
      "rutaImg": "busca.jpg"
    },
    {
      "autor": "Oscar Wilde",
      "descripcion":
          "La historia de un joven que conserva la juventud y la belleza mientras su retrato envejece y muestra los efectos de sus actos inmorales. Wilde explora la vanidad, la moralidad y el precio del deseo.",
      "nombreLibro": "El retrato de Dorian Gray",
      "precio": 13000,
      "disponible": true,
      "rutaImg": "retrato.jpg"
    },
    {
      "autor": "Washington Irving",
      "descripcion":
          "Una colección de cuentos y relatos inspirados en la Alhambra de Granada, donde Irving mezcla la realidad y la fantasía en historias que exploran la cultura árabe, el misterio y el romance.",
      "nombreLibro": "Cuentos de la Alhambra",
      "precio": 8000,
      "disponible": true,
      "rutaImg": "cuentos.jpg"
    },
    {
      "autor": "Louisa May Alcott",
      "descripcion":
          "La historia de las cuatro hermanas March mientras pasan de la infancia a la adultez durante la Guerra Civil estadounidense. Alcott aborda temas como el crecimiento personal, la familia y el rol de la mujer en la sociedad.",
      "nombreLibro": "Mujercitas",
      "precio": 21000,
      "disponible": true,
      "rutaImg": "mujercitas.jpg"
    },
    {
      "autor": "J.R.R. Tolkien",
      "descripcion":
          "Una épica saga fantástica que sigue la misión de Frodo Bolsón para destruir el Anillo Único y salvar a la Tierra Media del mal de Sauron. Tolkien crea un mundo rico en mitología, personajes memorables y batallas épicas.",
      "nombreLibro": "El señor de los anillos",
      "precio": 23000,
      "disponible": true,
      "rutaImg": "senor.jpg"
    },
    {
      "autor": "Milan Kundera",
      "descripcion":
          "Una novela que explora las relaciones humanas y la identidad personal en la Checoslovaquia comunista. Kundera reflexiona sobre la vida, el amor y la libertad a través de las vidas entrelazadas de varios personajes.",
      "nombreLibro": "La insoportable levedad del ser",
      "precio": 11000,
      "disponible": true,
      "rutaImg": "inso.jpg"
    },
    {
      "autor": "Umberto Eco",
      "descripcion":
          "Ambientada en un monasterio italiano en el siglo XIV, la novela sigue al monje franciscano Guillermo de Baskerville mientras investiga una serie de misteriosos asesinatos. Eco combina intriga, historia y filosofía en esta obra.",
      "nombreLibro": "El nombre de la rosa",
      "precio": 18000,
      "disponible": true,
      "rutaImg": "rosa.jpg"
    },
    {
      "autor": "Julio Cortázar",
      "descripcion":
          "Una novela experimental que desafía la estructura tradicional narrativa y presenta múltiples formas de lectura. Cortázar explora el amor, la identidad y la búsqueda de significado a través de los personajes de Horacio Oliveira y La Maga.",
      "nombreLibro": "Rayuela",
      "precio": 15000,
      "disponible": true,
      "rutaImg": "rayuela.jpg"
    },
    {
      "autor": "Patrick Süskind",
      "descripcion":
          "La historia de Jean-Baptiste Grenouille, un hombre con un sentido del olfato extraordinario que busca crear el perfume perfecto. Süskind explora temas como la obsesión, la identidad y el poder del aroma en la sociedad francesa del siglo XVIII.",
      "nombreLibro": "El perfume",
      "precio": 17000,
      "disponible": true,
      "rutaImg": "perfume.jpg"
    },
  ];

  try {
    for (var libro in libros) {
      await db.collection("Libros").add({
        "Autor": libro["autor"],
        "Descripcion": libro["descripcion"],
        "Nombre": libro["nombreLibro"],
        "Precio": libro["precio"],
        "Disponible": libro["disponible"],
        "RutaImg": libro["rutaImg"],
      });
    }
    print("Libros agregados exitosamente.");
  } catch (e) {
    print("Error al agregar libros: $e");
  }
}
