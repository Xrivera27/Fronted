import 'package:flutter/material.dart';
import 'package:login/Perfil.dart';
import 'package:login/Principal.dart';

class Notificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notificación 1'),
            subtitle: Text('Contenido de la notificación 1'),
            onTap: () {
              // Acción al hacer clic en la notificación 1
              print('Notificación 1 clicada');
            },
          ),
          ListTile(
            title: Text('Notificación 2'),
            subtitle: Text('Contenido de la notificación 2'),
            onTap: () {
              // Acción al hacer clic en la notificación 2
              print('Notificación 2 clicada');
            },
          ),
          ListTile(
            title: Text('Notificación 3'),
            subtitle: Text('Contenido de la notificación 3'),
            onTap: () {
              // Acción al hacer clic en la notificación 3
              print('Notificación 3 clicada');
            },
          ),
          // Agrega más notificaciones según sea necesario
        ],
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Perfil()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
