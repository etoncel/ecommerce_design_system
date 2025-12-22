// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/atoms/app_circular_image.dart';
import 'package:ecommerce_sample_design_system/src/atoms/app_text.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_spacing.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:flutter/material.dart';

/// El widget `CardItem` representa un elemento genérico con imagen y texto.
///
/// Combina un `AppCircularImage` y un `AppText` para mostrar la imagen y el nombre
/// del elemento.
class SingleListItem extends StatelessWidget {
  /// Crea un widget de elemento de lista.
  ///
  /// La [imageUrl] y [itemName] deben ser proporcionadas.
  const SingleListItem({
    required this.imageUrl,
    required this.itemName,
    this.onTap,
    super.key,
  });

  /// La URL de la imagen del elemento.
  final String imageUrl;

  /// El nombre del elemento.
  final String itemName;

  /// Función de devolución de llamada que se llama cuando se toca el elemento.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppCircularImage(imageUrl: imageUrl, size: 60.0),
          AppSpacing.verticalXxs,
          AppText(
            text: itemName,
            style: AppTextStyles.caption.copyWith(color: AppColors.textDark),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
