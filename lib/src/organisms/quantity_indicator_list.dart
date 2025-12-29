import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// Un organismo que muestra una lista de componentes [QuantityIndicator].
///
/// Este widget toma un título opcional y una lista de [QuantityIndicator]
/// para mostrarlos en una vista de lista vertical y desplazable.
class QuantityIndicatorList extends StatelessWidget {
  /// El título que se mostrará encima de la lista.
  final String? title;

  /// La lista de widgets [QuantityIndicator] para mostrar.
  final List<QuantityIndicator> indicators;

  /// Función que se llama cuando se selecciona un elemento de la lista
  ///
  /// Retonar la posición del elemento [pos]
  final Function(int pos)? onIndicatorSelected;

  /// Crea una instancia de [QuantityIndicatorList].
  ///
  /// Requiere una lista de [indicators]. El [title] es opcional.
  const QuantityIndicatorList({
    super.key,
    this.title,
    required this.indicators,
    this.onIndicatorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.spaceS),
            child: AppText(text: title!, style: AppTextStyles.headline2),
          ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: indicators.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onIndicatorSelected?.call(index),
              child: indicators[index],
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.spaceS),
        ),
      ],
    );
  }
}
