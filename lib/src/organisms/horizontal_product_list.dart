import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';

/// [HorizontalProductList] es un organismo que muestra una lista horizontal de
/// productos con un título.
///
/// Es ideal para secciones como "Nuevos Productos" o "Recomendados para ti".
class HorizontalProductList extends StatelessWidget {
  /// El título que se mostrará encima de la lista.
  final String title;

  /// La lista de widgets [ProductCard] que se mostrarán horizontalmente.
  final List<ProductCard> productCards;

  /// La altura de la lista. Por defecto es 250.
  final double listHeight;

  /// Crea un widget de lista horizontal de productos.
  const HorizontalProductList({
    super.key,
    required this.title,
    required this.productCards,
    this.listHeight = 250.0,
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
        SizedBox(
          height: listHeight,
          child: ListView.separated(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceS),
            scrollDirection: Axis.horizontal,
            itemCount: productCards.length,
            itemBuilder: (context, index) {
              return productCards[index];
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSpacing.spaceS),
          ),
        ),
      ],
    );
  }
}
