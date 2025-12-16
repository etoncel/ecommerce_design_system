// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// El widget `QuantitySelector` permite seleccionar una cantidad.
///
/// Consiste en un botón para decrementar, un texto para mostrar la cantidad y
/// un botón para incrementar.
class QuantitySelector extends StatefulWidget {
  /// Crea un selector de cantidad.
  ///
  /// La [initialQuantity] y [onChanged] deben ser proporcionadas.
  const QuantitySelector({
    required this.initialQuantity,
    required this.onChanged,
    this.minQuantity = 1,
    this.maxQuantity,
    super.key,
  });

  /// La cantidad inicial.
  final int initialQuantity;

  /// La cantidad mínima permitida.
  final int minQuantity;

  /// La cantidad máxima permitida.
  final int? maxQuantity;

  /// Función de devolución de llamada que se llama cuando la cantidad cambia.
  final ValueChanged<int> onChanged;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _decrement() {
    setState(() {
      if (_quantity > widget.minQuantity) {
        _quantity--;
        widget.onChanged(_quantity);
      }
    });
  }

  void _increment() {
    setState(() {
      if (widget.maxQuantity == null || _quantity < widget.maxQuantity!) {
        _quantity++;
        widget.onChanged(_quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const AppIcon(iconData: AppIcons.minus),
          onPressed: _decrement,
          visualDensity: VisualDensity.compact,
        ),
        AppSpacing.horizontalXxs,
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.spaceXs,
            vertical: AppSpacing.spaceXxs,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textLight.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(AppSpacing.spaceXs),
          ),
          child: AppText(
            text: _quantity.toString(),
            style: AppTextStyles.body.copyWith(color: AppColors.textDark),
          ),
        ),
        AppSpacing.horizontalXxs,
        IconButton(
          icon: const AppIcon(iconData: AppIcons.plus),
          onPressed: _increment,
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}
