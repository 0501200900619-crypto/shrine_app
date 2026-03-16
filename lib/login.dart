import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Controladores de texto para capturar lo que el usuario escribe
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            // 2. Logo y nombre de la app
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'), // Asegúrate de tenerlo en assets
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            
            // 3. Campo de Usuario
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            
            // 4. Campo de Contraseña
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true, // Esto oculta los caracteres
            ),
            
            // 5. Botones
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    // Limpiar los campos
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    // Navegar a la pantalla de inicio (Home)
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}