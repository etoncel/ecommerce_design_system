// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/atoms/app_circular_image.dart';
import 'package:ecommerce_sample_design_system/src/atoms/app_text.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_spacing.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:ecommerce_sample_design_system/src/molecules/product_rating.dart';
import 'package:flutter/material.dart';

/// El widget `ProductCard` es una tarjeta que muestra información de un producto.
/// incluyendo su calificación
class ProductCard extends StatelessWidget {
  /// Crea una tarjeta de producto.
  ///
  /// El [imageUrl], [title], y [subtitle] deben ser proporcionados.
  const ProductCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.rating = 0.0,
    this.onTap,
    super.key,
  });

  /// La URL de la imagen del producto.
  final String imageUrl;

  /// El nombre del producto.
  final String title;

  /// El precio del producto.
  final String subtitle;

  /// La calificación del producto.
  ///
  /// El valor predeterminado es 0.0.
  final double rating;

  /// Función de devolución de llamada que se llama cuando se toca la tarjeta.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: EdgeInsets.all(AppSpacing.spaceS),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.spaceS),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha((255 * 0.05).round()),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: AppCircularImage(imageUrl: imageUrl, size: 100)),
            AppSpacing.verticalS,
            AppText(
              text: title,
              style: AppTextStyles.body.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            AppSpacing.verticalXxs,
            AppText(
              text: subtitle,
              style: AppTextStyles.headline2.copyWith(color: AppColors.primary),
            ),
            AppSpacing.verticalXxs,
            ProductRating(rating: rating),
          ],
        ),
      ),
    );
  }
}
