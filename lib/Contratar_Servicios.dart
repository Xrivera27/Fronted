import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ServiHub',
      debugShowCheckedModeBanner: false,
      home: ContratarServicio(),
    );
  }
}

class ContratarServicio extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Servicio 1',
      description: 'Descripción del Servicio 1',
      price: '\$50',
    ),
    Service(
      title: 'Servicio 2',
      description: 'Descripción del Servicio 2',
      price: '\$30',
    ),
    Service(
      title: 'Servicio 3',
      description: 'Descripción del Servicio 3',
      price: '\$80',
    ),
    Service(
      title: 'Servicio 4',
      description: 'Descripción del Servicio 4',
      price: '\$60',
    ),
    Service(
      title: 'Servicio 5',
      description: 'Descripción del Servicio 5',
      price: '\$20',
    ),
    Service(
      title: 'Servicio 6',
      description: 'Descripción del Servicio 6',
      price: '\$10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Servicios'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return ServiceListItem(service: services[index]);
        },
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final String price;

  Service({required this.title, required this.description, required this.price});
}

class ServiceListItem extends StatelessWidget {
  final Service service;

  ServiceListItem({required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.title,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              service.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Precio: ${service.price}',
              style: const TextStyle(fontSize: 16.0, color: Colors.green),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () { 
                  },
                  child: const Text(
                    'Ver más',
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
