import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// Un botón de icono de aplicación personalizado.
///
/// Este widget combina un [AppText] y un [AppIcon] dentro de un contenedor
/// con un borde y relleno definidos.
class AppIconButton extends StatelessWidget {
  /// El texto que se mostrará junto al icono.
  final String text;

  /// El icono que se mostrará en el botón.
  final AppIcon icon;
  const AppIconButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spaceXs),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColors.primary, width: 1),
        borderRadius: BorderRadius.circular(AppSpacing.spaceS),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(text: text, style: AppTextStyles.caption),
          icon,
        ],
      ),
    );
  }
}
