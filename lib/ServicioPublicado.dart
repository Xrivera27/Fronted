import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ServiHub',
      debugShowCheckedModeBanner: false,
      home: ServicioPublicado(),
    );
  }
}

class ServicioPublicado extends StatefulWidget {
  const ServicioPublicado({Key? key});

  @override
  _NuevaPantallaState createState() => _NuevaPantallaState();
}

class _NuevaPantallaState extends State<ServicioPublicado> {
  String titulo = '';
  double precio = 0.0;
  int cantidad = 1;
  String ubicacion = '';
  String descripcion = '';
  String tipoPrecio = 'Por Hora';

  List<String> tiposPrecio = ['Por Hora', 'Por Proyecto'];
  List<String> departamentosHonduras = [
    'Atlántida', 'Choluteca', 'Colón', 'Comayagua', 'Copán', 'Cortés',
    'El Paraíso', 'Francisco Morazán', 'Gracias a Dios', 'Intibucá',
    'Islas de la Bahía', 'La Paz', 'Lempira', 'Ocotepeque', 'Olancho',
    'Santa Bárbara', 'Valle', 'Yoro'
  ];

  @override
  Widget build(BuildContext context) {
    if (ubicacion.isEmpty && departamentosHonduras.isNotEmpty) {
      ubicacion = departamentosHonduras.first;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ELIGE LA CATEGORIA'),
        backgroundColor: const Color.fromARGB(255, 247, 42, 236),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Titulo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    titulo = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Ej. Reparo Automoviles',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Precio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          precio = double.tryParse(value) ?? 0.0;
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Ej. 5000',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Radio(
                  value: 'Por Hora',
                  groupValue: tipoPrecio,
                  onChanged: (value) {
                    setState(() {
                      tipoPrecio = value as String;
                    });
                  },
                ),
                const Text('Por Hora'),
                Radio(
                  value: 'Por Proyecto',
                  groupValue: tipoPrecio,
                  onChanged: (value) {
                    setState(() {
                      tipoPrecio = value as String;
                    });
                  },
                ),
                const Text('Por Proyecto'),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Ubicacion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<String>(
                value: ubicacion,
                onChanged: (value) {
                  setState(() {
                    ubicacion = value ?? '';
                  });
                },
                items: departamentosHonduras
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                hint: const Text('Seleccione una ubicación'),
                isExpanded: true,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descripcion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    descripcion = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Describa detalladamente los servicios que ofrece ',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Botón de Publicar
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para publicar el servicio
                // Por ejemplo, puedes imprimir en la consola los valores ingresados
                print('Titulo: $titulo');
                print('Precio: $precio');
                print('Tipo de Precio: $tipoPrecio');
                print('Ubicacion: $ubicacion');
                print('Descripcion: $descripcion');

                // Navegar a la pantalla de publicación exitosa
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PublicacionExitosa(),
                  ),
                );
              },
              child: const Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}

class PublicacionExitosa extends StatelessWidget {
  const PublicacionExitosa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicación Exitosa'),
        backgroundColor: const Color.fromARGB(255, 247, 42, 236),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Servicio Publicado Exitosamente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
