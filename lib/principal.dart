import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Página Principal',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomeSelected = false;
  bool isNotificationsSelected = false;
  bool isProfileSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola'),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              'Que deseas hacer',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Contenido de notificaciones
          Visibility(
            visible: isNotificationsSelected,
            child: const Center(
              child: Text('Sin notificaciones'),
            ),
          ),
          // Contenido de perfil
          Visibility(
            visible: isProfileSelected,
            child: const Center(
              child: Text('¡Bienvenido a tu perfil!'),
            ),
          ),
          // Contenido de la página de inicio
          Visibility(
            visible: !isNotificationsSelected && !isProfileSelected,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Fila 1
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Buscar Servicio'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          print('Botón 2 clicado');
                        },
                        child: const Text('Ofrecer Servicio'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Evaluar trabajo'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                setState(() {
                  isNotificationsSelected = true;
                  isProfileSelected = false;
                  isHomeSelected = false;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                setState(() {
                  isHomeSelected = true;
                  isNotificationsSelected = false;
                  isProfileSelected = false;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                setState(() {
                  isProfileSelected = true;
                  isHomeSelected = false;
                  isNotificationsSelected = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
