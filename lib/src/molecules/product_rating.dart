import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// El widget `ProductRating` muestra la calificación de un producto.
///
/// Combina un `AppIcon` de estrella y un `AppText` para mostrar la calificación
/// numérica.
class ProductRating extends StatelessWidget {
  /// Crea un widget de calificación de producto.
  ///
  /// La [rating] debe ser proporcionada.
  const ProductRating({
    required this.rating,
    this.iconSize = 16.0,
    this.fontSize = 14.0,
    this.color = AppColors.accent,
    super.key,
  });

  /// La calificación numérica del producto (ej. 4.5).
  final double rating;

  /// El tamaño del ícono de estrella.
  ///
  /// El valor predeterminado es 16.0.
  final double iconSize;

  /// El tamaño de la fuente para la calificación numérica.
  ///
  /// El valor predeterminado es 14.0.
  final double fontSize;

  /// El color del ícono y del texto de la calificación.
  ///
  /// El valor predeterminado es `AppColors.accent`.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(iconData: AppIcons.star, size: iconSize, color: color),
        AppSpacing.horizontalXxs,
        AppText(
          text: rating.toStringAsFixed(1),
          style: AppTextStyles.body.copyWith(fontSize: fontSize, color: color),
        ),
      ],
    );
  }
}
