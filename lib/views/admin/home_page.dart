import 'package:flutter/material.dart';
import 'package:proyecto7/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libros'),
      ),
      body: FutureBuilder(
          future: getLibros(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deleteLibro(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                      setState(() {});
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  "Estas seguro de eliminar este registro?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, false);
                                    },
                                    child: const Text("Cancelar")),
                                TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, true);
                                    },
                                    child: const Text("Si, estoy seguro"))
                              ],
                            );
                          });

                      return result;
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                        color: Colors.red, child: const Icon(Icons.delete)),
                    key: Key(snapshot.data?[index]['uid']),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: ListTile(
                        title: Text(snapshot.data?[index]['Nombre']),
                        onTap: (() async {
                          await Navigator.pushNamed(context, '/update',
                              arguments: {
                                "Nombre": snapshot.data?[index]['Nombre'],
                                "uid": snapshot.data?[index]['uid']
                              });
                          setState(() {});
                        }),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
