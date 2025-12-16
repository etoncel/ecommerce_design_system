// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// El widget `AppText` es un contenedor del widget `Text` de Flutter.
///
/// Este widget facilita la aplicación de los estilos de texto predefinidos del
/// sistema de diseño (`AppTextStyles`).
class AppText extends StatelessWidget {
  /// Crea un widget de texto de aplicación.
  ///
  /// El [text] y el [style] deben ser proporcionados.
  const AppText({
    required this.text,
    required this.style,
    this.textAlign, // Nuevo parámetro
    super.key,
  });

  /// El texto que se va a mostrar.
  final String text;

  /// El estilo de texto que se va a aplicar.
  final TextStyle style;

  /// Cómo alinear el texto horizontalmente.
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign, // Pasar el textAlign al Text widget
    );
  }
}
