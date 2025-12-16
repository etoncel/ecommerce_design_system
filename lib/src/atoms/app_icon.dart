// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:flutter/material.dart';

/// El widget `AppIcon` es un contenedor para mostrar íconos de forma consistente.
///
/// Permite definir el tamaño y el color del ícono, utilizando los colores
/// definidos en `AppColors`.
class AppIcon extends StatelessWidget {
  /// Crea un widget de ícono de aplicación.
  ///
  /// El [iconData] debe ser proporcionado.
  const AppIcon({
    required this.iconData,
    this.size = 24.0,
    this.color = AppColors.textDark,
    super.key,
  });

  /// El ícono a mostrar.
  final IconData iconData;

  /// El tamaño del ícono.
  ///
  /// El valor predeterminado es 24.0.
  final double size;

  /// El color del ícono.
  ///
  /// El valor predeterminado es `AppColors.textDark`.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
