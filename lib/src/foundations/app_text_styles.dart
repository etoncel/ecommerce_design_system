// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/tokens/app_typography_tokens.dart';
import 'package:flutter/material.dart';

/// La clase `AppTextStyles` proporciona estilos de texto predefinidos para la aplicación.
///
/// Esta clase consume los tokens de tipografía de `AppTypographyTokens` y los
/// tokens de color de `AppColorTokens` para crear objetos `TextStyle` que se
/// pueden reutilizar en toda la aplicación.
///
/// Los estilos de texto están organizados por su función semántica, como
/// `headline1`, `body`, etc., para facilitar su uso y mantenimiento.
class AppTextStyles {
  /// Estilo para el titular principal.
  static const TextStyle headline1 = TextStyle(
    fontSize: AppTypographyTokens.fontSizeHeadline1,
    fontWeight: AppTypographyTokens.fontWeightBold,
    color: AppColors.textDark,
  );

  /// Estilo para el segundo titular.
  static const TextStyle headline2 = TextStyle(
    fontSize: AppTypographyTokens.fontSizeHeadline2,
    fontWeight: AppTypographyTokens.fontWeightBold,
    color: AppColors.textDark,
  );

  /// Estilo para el cuerpo del texto.
  static const TextStyle body = TextStyle(
    fontSize: AppTypographyTokens.fontSizeBody,
    fontWeight: AppTypographyTokens.fontWeightNormal,
    color: AppColors.textLight,
  );

  /// Estilo para el texto de pie de foto.
  static const TextStyle caption = TextStyle(
    fontSize: AppTypographyTokens.fontSizeCaption,
    fontWeight: AppTypographyTokens.fontWeightNormal,
    color: AppColors.textLight,
  );

  /// Estilo para el texto de los botones.
  static const TextStyle button = TextStyle(
    fontSize: AppTypographyTokens.fontSizeButton,
    fontWeight: AppTypographyTokens.fontWeightBold,
    color: AppColors.white,
  );
}
