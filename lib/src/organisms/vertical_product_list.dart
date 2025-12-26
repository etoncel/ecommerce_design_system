import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// [VerticalProductList] es un organismo que muestra una lista vertical de
/// productos con un título.
///
/// Es ideal para secciones como "Nuevos Productos" o "Recomendados para ti".
class VerticalProductList extends StatelessWidget {
  /// El título que se mostrará encima de la lista.
  final String title;

  /// La lista de widgets [ProductCard] que se mostrarán horizontalmente.
  final List<ProductCard> productCards;

  /// Crea un widget de lista horizontal de productos.
  const VerticalProductList({
    super.key,
    required this.title,
    required this.productCards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceS),
          child: AppText(text: title, style: AppTextStyles.headline2),
        ),
        const SizedBox(height: AppSpacing.spaceS),
        ListView.separated(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceS),
          scrollDirection: Axis.vertical,
          itemCount: productCards.length,
          itemBuilder: (context, index) {
            return productCards[index];
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.spaceS),
        ),
      ],
    );
  }
}
