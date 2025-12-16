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
    this.textAlign,
    this.maxLines,
    this.overflow,
    super.key,
  });

  /// El texto que se va a mostrar.
  final String text;

  /// El estilo de texto que se va a aplicar.
  final TextStyle style;

  /// Cómo alinear el texto horizontalmente.
  final TextAlign? textAlign;

  /// El número máximo de líneas para mostrar el texto.
  final int? maxLines;

  /// Cómo manejar el texto que excede el número máximo de líneas.
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
