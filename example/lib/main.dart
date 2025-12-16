import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:example/screens/foundations_showcase_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Showroom',
      theme: AppTheme.theme, // Aplicamos el tema global del sistema de diseño
      home:
          const FoundationsShowcaseScreen(), // Mostramos la pantalla de tokens
    );
  }
}
