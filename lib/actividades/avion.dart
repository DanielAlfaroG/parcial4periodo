import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/temas/colores.dart';

class avion extends StatefulWidget {
  const avion({super.key});

  @override
  _avionState createState() => _avionState();
}

class _avionState extends State<avion> {

  final CollectionReference _avion =
  FirebaseFirestore.instance.collection('avion');

  //Vista general
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        backgroundColor: colorPrinc,
        title: const Center(
          child: Text(
              'Aviones'
          ),
        ),
      ),
      //Informacion y contenido de la tabla:
      body: StreamBuilder(
        stream: _avion.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: colorPrinc,
                  child: ListTile(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(documentSnapshot['codigo'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                          Text(documentSnapshot['marca'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                          Text(documentSnapshot['estado'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Codigo", style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text("Marca", style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text("Estado", style: TextStyle(fontSize: 10, color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}