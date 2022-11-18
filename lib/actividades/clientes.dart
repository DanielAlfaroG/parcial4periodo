import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/temas/colores.dart';

class clientes extends StatefulWidget {
  const clientes({super.key});

  @override
  State<clientes> createState() => _clientesState();
}

class _clientesState extends State<clientes> {
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _fecha_nacimientoController = TextEditingController();
  final TextEditingController _reservasController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();

  final CollectionReference _clientes =
  FirebaseFirestore.instance.collection('clientes');

  //insertar
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: 'cedula'),
                ),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'nombre',
                  ),
                ),
                TextField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                  ),
                ),
                TextField(
                  controller: _fecha_nacimientoController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento (dd-mm-aaaa)',
                  ),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
                  controller: _reservasController,
                  decoration: const InputDecoration(labelText: 'numero de la reserva'),
                ),
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(
                    labelText: 'Sexo:',
                  ),
                ),
                TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de usuario',
                  ),
                ),
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final int? cedula = int.tryParse(_cedulaController.text);;
                    final String nombre = _nombreController.text;
                    final String apellido = _apellidoController.text;
                    final String fecha = _fecha_nacimientoController.text;
                    final int reserva = int.parse(_reservasController.text);
                    final String sexo = _sexoController.text;
                    final String tipo = _tipoController.text;
                    final String usuario = _usuarioController.text;
                    if (cedula != null) {
                      await _clientes
                          .add({"cedula": cedula, "nombre": nombre, "Apellido": apellido, "fecha_nacimiento": fecha, "reservas": reserva, "sexo":sexo, "tipo":tipo, "usuario":usuario});
                      _cedulaController.text = '';
                      _nombreController.text = '';
                      _apellidoController.text = '';
                      _fecha_nacimientoController.text = '';
                      _reservasController.text = '';
                      _sexoController.text = '';
                      _tipoController.text = '';
                      _usuarioController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //actualizar
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _cedulaController.text = documentSnapshot['cedula'].toString();
      _nombreController.text = documentSnapshot['nombre'].toString();
      _apellidoController.text = documentSnapshot['Apellido'].toString();
      _fecha_nacimientoController.text = documentSnapshot['fecha_nacimiento'].toString();
      _reservasController.text = documentSnapshot['reservas'].toString();
      _sexoController.text = documentSnapshot['sexo'].toString();
      _tipoController.text = documentSnapshot['tipo'].toString();
      _usuarioController.text = documentSnapshot['usuario'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: 'cedula'),
                ),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'nombre',
                  ),
                ),
                TextField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(
                    labelText: 'Apellido',
                  ),
                ),
                TextField(
                  controller: _fecha_nacimientoController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento (dd-mm-aaaa)',
                  ),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
                  controller: _reservasController,
                  decoration: const InputDecoration(labelText: 'numero de la reserva'),
                ),
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(
                    labelText: 'Sexo:',
                  ),
                ),
                TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de usuario',
                  ),
                ),
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final int? cedula = int.tryParse(_cedulaController.text);;
                    final String nombre = _nombreController.text;
                    final String apellido = _apellidoController.text;
                    final String fecha = _fecha_nacimientoController.text;
                    final int reserva = int.parse(_reservasController.text);
                    final String sexo = _sexoController.text;
                    final String tipo = _tipoController.text;
                    final String usuario = _usuarioController.text;
                    if (cedula != null) {
                      await _clientes
                          .doc(documentSnapshot!.id)
                          .update({"cedula": cedula, "nombre": nombre, "Apellido": apellido, "fecha_nacimiento": fecha, "reservas": reserva, "sexo":sexo, "tipo":tipo, "usuario":usuario});
                      _cedulaController.text = '';
                      _nombreController.text = '';
                      _apellidoController.text = '';
                      _fecha_nacimientoController.text = '';
                      _reservasController.text = '';
                      _sexoController.text = '';
                      _tipoController.text = '';
                      _usuarioController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  //borrar
  Future<void> _delete(String productId) async {
    await _clientes.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El usuario fue eliminado correctamente')));
  }

  //Mostrar informacion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: fondo,
        appBar: AppBar(
          title: const Center(child: Text('Clientes')),
          backgroundColor: colorPrinc,
        ),
        body: StreamBuilder(
          stream: _clientes.snapshots(),
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
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Id: ${documentSnapshot['cedula']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Nombre: ${documentSnapshot['nombre']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Apellido: ${documentSnapshot['Apellido']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          Text("Fecha: ${documentSnapshot['fecha_nacimiento']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Numero de Reserva${documentSnapshot['reservas']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Sexo: ${documentSnapshot['sexo']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Tipo de usuario: ${documentSnapshot['tipo']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                          const SizedBox(height: 5),
                          Text("Usuario: ${documentSnapshot['usuario']}", style: const TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
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
        // agregar clientes
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}