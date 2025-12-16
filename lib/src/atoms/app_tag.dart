// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_spacing.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:flutter/material.dart';

/// El widget `AppTag` es una pequeña etiqueta de texto con fondo de color.
///
/// Se utiliza para mostrar insignias como "New" o "Sale".
class AppTag extends StatelessWidget {
  /// Crea un widget de etiqueta de aplicación.
  ///
  /// El [text] debe ser proporcionado.
  const AppTag({
    required this.text,
    this.backgroundColor = AppColors.accent,
    this.textColor = AppColors.white,
    super.key,
  });

  /// El texto que se va a mostrar en la etiqueta.
  final String text;

  /// El color de fondo de la etiqueta.
  ///
  /// El valor predeterminado es `AppColors.accent`.
  final Color backgroundColor;

  /// El color del texto de la etiqueta.
  ///
  /// El valor predeterminado es `AppColors.white`.
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spaceXs,
        vertical: AppSpacing.spaceXxs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.spaceXxs),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(color: textColor),
      ),
    );
  }
}
