import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Registro App',
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: _firstNameController,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _lastNameController,
            decoration: const InputDecoration(labelText: 'Apellido'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Celular'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Usuario'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _birthdateController,
            decoration:
                const InputDecoration(labelText: 'Fecha de nacimiento'),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _confirmPasswordController,
            decoration:
                const InputDecoration(labelText: 'Confirmar Contraseña'),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _genderController,
            decoration: const InputDecoration(labelText: 'Sexo'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _handleRegistration(context);
            },
            child: Text('Registrarse'),
          ),
        ],
      ),
    );
  }

  void _handleRegistration(BuildContext context) {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String username = _usernameController.text;
    String birthdate = _birthdateController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String gender = _genderController.text;

    if (password == confirmPassword) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Registro exitoso'),
            content: Text(
                'Nombre: $firstName\nApellido: $lastName\nEmail: $email\nCelular: $phone\nUsuario: $username\nFecha de Nacimiento: $birthdate\nContraseña: $password\nSexo: $gender'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error de registro'),
            content: Text('Las contraseñas no coinciden.'),
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
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
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                // ... código del formulario de inicio de sesión
              ],
            ),
          ),
        ),
      ),
    );
  }
}
