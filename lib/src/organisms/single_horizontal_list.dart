// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/molecules/single_list_item.dart';
import 'package:ecommerce_sample_design_system/src/ui_models/single_list_item_data.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_spacing.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:ecommerce_sample_design_system/src/atoms/app_text.dart';

/// Un widget de organismo que muestra una lista horizontal de tarjetas.
///
/// Utiliza la molécula [SingleListItem] para renderizar cada elemento en la lista.
class SingleHorizontalList extends StatelessWidget {
  /// Crea un widget de lista de tarjetas horizontal.
  ///
  /// La lista de [items] debe ser proporcionada.
  const SingleHorizontalList({
    required this.items,
    required this.title,
    super.key,
  });

  /// El título que se mostrará encima de la lista.
  final String title;

  /// La lista de datos de tarjetas a mostrar.
  final List<SingleListItemData> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceM),
          child: AppText(text: title, style: AppTextStyles.headline2),
        ),
        AppSpacing.verticalXs,
        SizedBox(
          height: 90.0, // Altura suficiente para la imagen y el texto.
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spaceM),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return SingleListItem(
                imageUrl: item.imageUrl,
                itemName: item.itemName,
                onTap: item.onTap,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return AppSpacing.horizontalXs;
            },
          ),
        ),
      ],
    );
  }
}
