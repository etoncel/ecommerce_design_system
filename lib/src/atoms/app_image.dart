import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// El widget `AppImage` muestra una imagen en un contenedor.
///
/// Permite definir el tamaño de la imagen y si tiene un borde.
class AppImage extends StatelessWidget {
  /// Crea un widget de imagen.
  ///
  /// La [imageUrl] debe ser proporcionada.
  const AppImage({
    required this.imageUrl,
    this.size,
    this.hasBorder = false,
    super.key,
  });

  /// La URL de la imagen a mostrar.
  final String imageUrl;

  /// El tamaño (ancho y alto) de la imagen.
  ///
  /// El valor predeterminado es nulo
  final double? size;

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
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(AppSizes.sXS),
        border: hasBorder
            ? Border.all(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 2,
              )
            : null,
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 30),
      ),
    );
  }
}
