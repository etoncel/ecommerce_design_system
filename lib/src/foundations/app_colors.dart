// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:ecommerce_sample_design_system/src/tokens/app_color_tokens.dart';

/// La clase `AppColors` proporciona una paleta de colores definida para la aplicación.
///
/// Esta clase consume los tokens de color de `AppColorTokens` y los convierte en
/// objetos `Color` de Flutter para ser utilizados en todo el sistema de diseño.
///
/// Los nombres de los colores son semánticos para facilitar su uso y permitir
/// cambios de tema en el futuro.
class AppColors {
  /// Color primario de la aplicación.
  static const Color primary = Color(AppColorTokens.primary);

  /// Color secundario de la aplicación.
  static const Color secondary = Color(AppColorTokens.secondary);

  /// Color de acento de la aplicación.
  static const Color accent = Color(AppColorTokens.accent);

  /// Color de fondo de la aplicación.
  static const Color background = Color(AppColorTokens.background);

  /// Color de texto oscuro.
  static const Color textDark = Color(AppColorTokens.textDark);

  /// Color de texto claro.
  static const Color textLight = Color(AppColorTokens.textLight);

  /// Color blanco.
  static const Color white = Color(AppColorTokens.white);

  /// Color negro.
  static const Color black = Color(AppColorTokens.black);
}
