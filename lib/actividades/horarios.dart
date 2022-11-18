import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/temas/colores.dart';

class horarios extends StatefulWidget {
  const horarios({super.key});

  @override
  _horariosState createState() => _horariosState();
}

class _horariosState extends State<horarios> {
  final CollectionReference _horarios =
      FirebaseFirestore.instance.collection('horarios');

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
            'Horarios de vuelos'
          ),
        ),
      ),
      //Informacion y contenido de la tabla:
      body: StreamBuilder(
        stream: _horarios.snapshots(),
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
                    title: Center(child: Text(documentSnapshot['hora_vuelo'].toString(), style: const TextStyle(fontSize: 25, color: Colors.white))),
                    subtitle: Center(child: Text(documentSnapshot['id_horario'].toString(), style: const TextStyle(color: Colors.white))),
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