import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:example/screens/showcase_home_page.dart';
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
      theme: AppTheme.theme,
      home: const ShowcaseHomePage(), // Set ShowcaseHomePage as the home widget
    );
  }
}
