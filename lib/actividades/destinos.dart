import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/temas/colores.dart';

class destinos extends StatefulWidget {
  const destinos({super.key});

  @override
  _destinosState createState() => _destinosState();
}

class _destinosState extends State<destinos> {
  final CollectionReference _destinos =
  FirebaseFirestore.instance.collection('destinos');

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
              'Destinos'
          ),
        ),
      ),
      //Informacion y contenido de la tabla:
      body: StreamBuilder(
        stream: _destinos.snapshots(),
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
                        Text(documentSnapshot['id_destino'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        Text(documentSnapshot['nombre'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        Text(documentSnapshot['horario'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Id", style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text("nombre", style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text("Numero de horario", style: TextStyle(fontSize: 10, color: Colors.white)),
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