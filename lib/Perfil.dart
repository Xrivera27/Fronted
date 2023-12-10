import 'package:flutter/material.dart';
import 'package:login/Notificaciones.dart';
import 'package:login/Principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServiHub',
      debugShowCheckedModeBanner: false,
      home: Perfil(),
    );
  }
}

class Perfil extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Servicio 1',
      description: 'Descripción del Servicio 1 ',
      precio: 5,
      ubicacion: 'La Ceiba',
    ),
    Service(
      title: 'Servicio 2',
      description: 'Descripción del Servicio 2 ',
      precio: 20,
      ubicacion: 'La Ceiba',
    ),
    Service(
      title: 'Servicio 3',
      description: 'Descripción del Servicio 3 ',
      precio: 1,
      ubicacion: 'La Ceiba',
    ),
    Service(
      title: 'Servicio 4',
      description: 'Descripción del Servicio 4 ',
      precio: 7,
      ubicacion: 'La Ceiba',
    ),
  ];

  final int userRating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Usuario'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50.0,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Nombre:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Activo desde:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Clasificación General',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 3.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < userRating; i++)
                  const Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Trabajos Activos',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 2,
                ),
                itemCount: services.length,
                itemBuilder: (BuildContext context, int index) {
                  return ServiceGridItem(service: services[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notificaciones()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Principal()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final String ubicacion;
  final double precio;

  Service({required this.title, required this.description, required this.ubicacion, required this.precio});
}

class ServiceGridItem extends StatelessWidget {
  final Service service;

  ServiceGridItem({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service.title,
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'L. ${service.precio.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Text(
              service.ubicacion,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              service.description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
