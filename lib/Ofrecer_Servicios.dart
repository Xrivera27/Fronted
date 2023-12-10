import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ServiHub',
      debugShowCheckedModeBanner: false,
      home: OfrecerServicio(),
    );
  }
}

class OfrecerServicio extends StatefulWidget {
  const OfrecerServicio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<OfrecerServicio> {
  bool isHomeSelected = false;
  bool isNotificationsSelected = false;
  bool isProfileSelected = false;

  List<String> serviciosNoProfesionales = [
    'Carpintería',
    'Cerrajería',
    'Albañil',
    'Mecánico',
    'Fontanería',
    'Soldador',
    'Sastre',
    'Escultor',
    'Barbero',
    'Niñero',
    'Cocinero',
    'Repartidor',
    'Exterminador',
    'Ebanista',
    'Electricista',
    'Cuidado de mascotas',
    'Agricultor',
    'Limpieza del hogar',
    'Lavandería',
    'Técnico en computación',
    'Pintura',
    'Cuidado de ancianos',
    'Organización de eventos',
    'Entrenador personal',
    'Masajista',
    'Asistente personal',
    'Costurero',
    'Reparación de electrodomésticos',
    'Servicios de mudanza',
  ];

  List<String> imageUrls = [
    'url1',
    'url2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ELIGE LA CATEGORIA'),
        backgroundColor: const Color.fromARGB(255, 247, 42, 236),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isNotificationsSelected,
            child: const Center(
              child: Text('Sin notificaciones'),
            ),
          ),
          Visibility(
            visible: isProfileSelected,
            child: const Center(
              child: Text('¡Bienvenido a tu perfil!'),
            ),
          ),
          Visibility(
            visible: !isNotificationsSelected && !isProfileSelected,
            child: buildGrid(),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavBarIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  Widget buildGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: serviciosNoProfesionales.length,
        itemBuilder: (BuildContext context, int index) {
          return buildSquareButton(serviciosNoProfesionales[index]);
        },
      ),
    );
  }

  Widget buildSquareButton(String serviceName) {
    return Container(
      margin: const EdgeInsets.all(7.0),
      child: ElevatedButton(
        onPressed: () {
          // Acción para el botón 
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // minimumSize: const Size(150, 150),
        ),
        child: Center(
          child: Text(
            serviceName,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
