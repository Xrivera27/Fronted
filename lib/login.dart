import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Fondo azul
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color blanco para el texto
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white, // Fondo blanco para el campo de texto
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white, // Fondo blanco para el campo de texto
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica de inicio de sesión (ya proporcionada en el ejemplo anterior)
                    _handleLogin(context);
                  },
                  child: const Text('Iniciar sesión'),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    // Navegar a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: const Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Lógica de autenticación (ya proporcionada en el ejemplo anterior)
    if (username == 'usuario' && password == 'contraseña') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error de inicio de sesión'),
            content: const Text('Nombre de usuario o contraseña incorrectos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }
}

class RegisterPage extends StatelessWidget {
  final TextEditingController _newUsernameController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _newUsernameController,
              decoration: const InputDecoration(labelText: 'Nuevo usuario'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _newPasswordController,
              decoration: const InputDecoration(labelText: 'Nueva contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de registro (puedes personalizar según tus necesidades)
                _handleRegistration(context);
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegistration(BuildContext context) {
    String newUsername = _newUsernameController.text;
    String newPassword = _newPasswordController.text;

    // Lógica de registro (puedes personalizar según tus necesidades)
    // Aquí puedes almacenar las nuevas credenciales, por ejemplo, en una base de datos o en algún servicio de backend.
    // En este ejemplo, simplemente mostramos un mensaje de éxito.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Registro exitoso'),
          content: Text('Usuario: $newUsername\nContraseña: $newPassword'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navegar de vuelta a la pantalla de inicio de sesión después del registro exitoso
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: const Center(
        child: Text('¡Has iniciado sesión con éxito!'),
      ),
    );
  }
}
