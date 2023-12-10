import 'package:flutter/material.dart';
import 'package:login/Principal.dart';

class Service {
  final String title;
  final String description;
  final String price;
  final String location;

  Service({
    required this.title,
    required this.description,
    required this.price,
    required this.location,
  });

  factory Service.fromDatabase(Map<String, dynamic> data) {
    return Service(
      title: data['title'],
      description: data['description'],
      price: data['price'],
      location: data['location'],
    );
  }
}

class ServiceDetailsPage extends StatefulWidget {
  final Service service;

  ServiceDetailsPage({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceDetailsPageState createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  bool termsAndConditionsAccepted = false;
  double userBalance = 100.0; // Saldo del usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Servicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.service.title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.service.description,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Precio: ${widget.service.price}',
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ubicación: ${widget.service.location}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Saldo Disponible: \$${userBalance.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón para recargar saldo
                    print('Recargar Saldo');
                  },
                  child: Text('Recargar Saldo'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: termsAndConditionsAccepted,
                  onChanged: (value) {
                    setState(() {
                      termsAndConditionsAccepted = value!;
                    });
                  },
                ),
                Text(
                  'Acepto los Términos y Condiciones',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Expanded(child: SizedBox(height: 16.0)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (termsAndConditionsAccepted && userBalance >= double.parse(widget.service.price)) {
                    // Acción al confirmar la contratación del servicio
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationPage(service: widget.service),
                      ),
                    );
                  } else {
                    // Acción cuando los términos y condiciones no están aceptados o el saldo es insuficiente
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Debes aceptar los Términos y Condiciones y tener saldo suficiente.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Confirmar Contratación'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  final Service service;

  ConfirmationPage({required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal, // Establece el color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¡Servicio contratado con éxito!',
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Servicio: ${service.title}',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Precio: ${service.price}',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Ubicación: ${service.location}',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Principal(),
                  ),
                );
              },
              child: Text('Volver al Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}

 

void main() {
  final Map<String, dynamic> dataFromDatabase = {
    'title': 'Plomero',
    'description': 'Oficio no profesional de plomería. Realizo reparaciones y instalaciones de tuberías, grifos y desagües.',
    'price': '50.0',
    'location': 'Ciudad: La Ceiba',
  };

  final Service service = Service.fromDatabase(dataFromDatabase);

  runApp(
    MaterialApp(
      title: 'Detalles del Servicio',
      debugShowCheckedModeBanner: false,
      home: ServiceDetailsPage(service: service),
    ),
  );
}
