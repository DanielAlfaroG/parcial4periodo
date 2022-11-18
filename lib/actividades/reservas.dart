import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/temas/colores.dart';

class reservas extends StatefulWidget {
  const reservas({super.key});

  @override
  _reservasState createState() => _reservasState();
}

class _reservasState extends State<reservas> {
  final CollectionReference _reservas =
  FirebaseFirestore.instance.collection('reservas');

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
              'Reservas'
          ),
        ),
      ),
      //Informacion y contenido de la tabla:
      body: StreamBuilder(
        stream: _reservas.snapshots(),
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
                        Text(documentSnapshot['idReservas'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        Text(documentSnapshot['estado'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                        Text(documentSnapshot['vuelo'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Id", style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text("Estado", style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text("Numero de vuelo", style: TextStyle(fontSize: 10, color: Colors.white)),
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