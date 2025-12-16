// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? AppColors.primary : AppColors.secondary,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
      ),
      child: Text(text),
    );
  }
}
