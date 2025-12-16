// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/atoms/app_circular_image.dart';
import 'package:ecommerce_sample_design_system/src/atoms/app_text.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_spacing.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:flutter/material.dart';

/// El widget `CategoryItem` representa un elemento de categoría de producto.
///
/// Combina un `AppCircularImage` y un `AppText` para mostrar la imagen y el nombre
/// de la categoría.
class CategoryItem extends StatelessWidget {
  /// Crea un widget de elemento de categoría.
  ///
  /// La [imageUrl] y [categoryName] deben ser proporcionadas.
  const CategoryItem({
    required this.imageUrl,
    required this.categoryName,
    this.onTap,
    super.key,
  });

  /// La URL de la imagen de la categoría.
  final String imageUrl;

  /// El nombre de la categoría.
  final String categoryName;

  /// Función de devolución de llamada que se llama cuando se toca el elemento.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppCircularImage(
            imageUrl: imageUrl,
            size: 60.0,
          ),
          AppSpacing.verticalXxs,
          SizedBox(
            width: 70, // Ancho fijo para el texto para evitar desbordamiento
            child: AppText(
              text: categoryName,
              style: AppTextStyles.caption.copyWith(color: AppColors.textDark),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
