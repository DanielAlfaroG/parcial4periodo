import 'package:flutter/material.dart';
import 'package:parcial4/actividades/avion.dart';
import 'package:parcial4/actividades/clientes.dart';
import 'package:parcial4/actividades/destinos.dart';
import 'package:parcial4/actividades/horarios.dart';
import 'package:parcial4/actividades/reservas.dart';
import 'package:parcial4/actividades/vuelos.dart';
import 'package:parcial4/temas/colores.dart';

import 'package:transition/transition.dart';

class principal extends StatefulWidget {
  principal({Key ?key}) : super(key: key);

  @override
  _principalState createState() {
    return _principalState();
  }
}

class _principalState extends State<principal> {
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    const List Opciones = [
      "Horarios",
      "Destinos",
      "Aviones",
      "Vuelos",
      "Reservas",
      "Clientes"
    ];

    // TODO: implement build
    return Scaffold(
      backgroundColor: fondo,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Vuelos El Salvador", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              Container(height: 35),
              Column(
                children: List.generate(Opciones.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                            index==0?horarios():index==1?destinos():index==2?avion():index==3?vuelos():index==4?reservas():index==5?clientes():principal()
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                        height: 55,
                        width: ancho,
                        decoration: const BoxDecoration(
                          color: colorSecn,
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            Opciones[index], textAlign: TextAlign.center, style: const TextStyle(
                            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}