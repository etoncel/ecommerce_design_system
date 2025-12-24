// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';

import 'package:flutter/material.dart';

/// El widget `AppButton` es un botón personalizado que se puede utilizar en toda la
/// aplicación.
///
/// Ofrece dos estilos principales: primario y secundario, que se pueden
/// configurar mediante el parámetro `isPrimary`.
class AppButton extends StatelessWidget {
  /// Crea un widget de botón de aplicación.
  ///
  /// El [onPressed] eldebe ser proporcionado.
  const AppButton({
    required this.onPressed,
    required this.text,
    this.isPrimary = true,
    this.size = AppSizes.sM,
    super.key,
  });

  /// La función de devolución de llamada que se llama cuando se presiona el botón.
  final VoidCallback onPressed;

  /// El texto que se muestra en el botón.
  final String text;

  /// Si el botón es de estilo primario o secundario.
  ///
  /// El valor predeterminado es `true` (estilo primario).
  final bool isPrimary;

  // /// Altura del botón
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.primary : AppColors.secondary,
        foregroundColor: Colors.white,
        textStyle: size == AppSizes.sM
            ? AppTextStyles.button
            : AppTextStyles.smallButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.sL),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: Text(text),
    );
  }
}
