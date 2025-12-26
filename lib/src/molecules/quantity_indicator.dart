import 'package:ecommerce_sample_design_system/src/atoms/app_text.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Un widget para mostrar un nombre y una cantidad con estilos diferentes
/// utilizando los componentes del sistema de diseño.
///
/// Muestra el [name] con el estilo `headline2` de `AppTextStyles` y
/// la [quantity] con el estilo `body` de `AppTextStyles` pero con color gris,
/// en el formato: `nombre (cantidad)`.
class QuantityIndicator extends StatelessWidget {
  /// El texto principal que se mostrará.
  final String name;

  /// El número que se mostrará entre paréntesis.
  final int quantity;

  /// Crea una instancia de QuantityIndicator.
  ///
  /// Requiere un [name] y una [quantity].
  const QuantityIndicator({
    super.key,
    required this.name,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(text: name, style: AppTextStyles.headline2),
        AppText(
          text: ' ($quantity)',
          style: AppTextStyles.body.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
