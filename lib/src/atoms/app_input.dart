// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_spacing.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:flutter/material.dart';

/// El widget `AppInput` es un campo de texto con estilos predefinidos.
///
/// Permite definir un `labelText`, `hintText`, y `controller` opcionales.
class AppInput extends StatelessWidget {
  /// Crea un widget de campo de texto de aplicación.
  const AppInput({
    this.labelText,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.suffixIcon, // Nuevo parámetro
    super.key,
  });

  /// Texto que describe el campo de entrada.
  final String? labelText;

  /// Texto de sugerencia que se muestra cuando el campo está vacío.
  final String? hintText;

  /// Controlador para el campo de texto.
  final TextEditingController? controller;

  /// Si el texto debe ser ocultado (para contraseñas).
  final bool obscureText;

  /// El tipo de teclado a utilizar.
  final TextInputType? keyboardType;

  /// Función de validación para el campo de texto.
  final String? Function(String?)? validator;

  /// Función de devolución de llamada que se llama cuando el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Un widget para mostrar al final del campo de entrada (ej. un icono).
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: AppTextStyles.body.copyWith(color: AppColors.textDark),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: AppTextStyles.body.copyWith(color: AppColors.textLight),
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.textLight),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.spaceS,
          vertical: AppSpacing.spaceM,
        ),
        suffixIcon: suffixIcon, // Pasar el suffixIcon al InputDecoration
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          borderSide: const BorderSide(color: AppColors.textLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          borderSide: const BorderSide(color: AppColors.textLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
