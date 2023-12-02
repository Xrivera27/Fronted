import 'package:flutter/material.dart';
import 'login.dart'; // Importa el archivo principal para la navegación de vuelta

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

  bool _validateAllFields() {
    // Realiza validaciones para asegurarte de que todos los campos estén llenos
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _birthdateController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _genderController.text.isNotEmpty;
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_validateAllFields()) {
                    _handleRegistration(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error de registro'),
                          content: Text('Todos los campos son obligatorios.'),
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
                },
                child: Text('Registrarse'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_validateAllFields()) {
                    _handleRegistration(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error de registro'),
                          content: Text('Todos los campos son obligatorios.'),
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
                },
                child: Text('Aceptar'),
              ),
            ],
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
      // Lógica de registro (puedes personalizar según tus necesidades)
      // Aquí puedes almacenar las nuevas credenciales, por ejemplo, en una base de datos o en algún servicio de backend.
      // En este ejemplo, simplemente mostramos un mensaje de éxito.
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
                  // Navegar de vuelta a la pantalla de inicio de sesión después del registro exitoso
                  Navigator.pop(context);
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
      // Después de realizar el registro, puedes realizar acciones adicionales según tus necesidades.
      // Por ejemplo, puedes enviar datos al servidor, almacenar en la base de datos local, etc.

      // Limpia los controladores después del registro
      _firstNameController.clear();
      _lastNameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _usernameController.clear();
      _birthdateController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _genderController.clear();
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
