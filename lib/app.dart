import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
      },
      theme: _kShrineTheme, // Aplicamos el tema aquí
    );
  }
}

// Configuración del Tema
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    // Configuración de los campos de texto (TextFields)
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBrown900,
      ),
    ),
  );
}