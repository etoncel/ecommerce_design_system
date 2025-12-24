import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// El widget `AppSearchBar` es una molécula que combina un `AppInput` y un `AppIcon` de búsqueda.
///
/// Permite al usuario introducir texto de búsqueda y tiene un ícono de búsqueda
/// al final.
class AppSearchBar extends StatelessWidget {
  /// Crea un widget de barra de búsqueda.
  const AppSearchBar({
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  /// Texto de sugerencia que se muestra cuando el campo de búsqueda está vacío.
  final String? hintText;

  /// Controlador para el campo de texto de búsqueda.
  final TextEditingController? controller;

  /// Función de devolución de llamada que se llama cuando el texto cambia.
  final ValueChanged<String>? onChanged;

  /// Función de devolución de llamada que se llama cuando el usuario envía el texto (ej. presiona Enter).
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.spaceL * 1.5, // Altura fija para la barra de búsqueda
      child: AppInput(
        controller: controller,
        hintText: hintText ?? 'Buscar...',
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: AppSpacing.spaceS),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: AppButton(
              onPressed: () {},
              isPrimary: false,
              text: "Search",
              size: AppSizes.sXS,
            ),
          ),
        ),
      ),
    );
  }
}
