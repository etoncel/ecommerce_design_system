// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:flutter/material.dart';

/// El widget `AppCircularImage` muestra una imagen en un contenedor circular.
///
/// Permite definir el tamaño de la imagen y si tiene un borde.
class AppCircularImage extends StatelessWidget {
  /// Crea un widget de imagen circular de aplicación.
  ///
  /// La [imageUrl] debe ser proporcionada.
  const AppCircularImage({
    required this.imageUrl,
    this.size = 60.0,
    this.hasBorder = false,
    super.key,
  });

  /// La URL de la imagen a mostrar.
  final String imageUrl;

  /// El tamaño (ancho y alto) de la imagen circular.
  ///
  /// El valor predeterminado es 60.0.
  final double size;

  /// Si la imagen debe tener un borde.
  ///
  /// El valor predeterminado es `false`.
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: hasBorder
            ? Border.all(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 30),
        ),
      ),
    );
  }
}
