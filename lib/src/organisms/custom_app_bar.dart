import 'package:ecommerce_sample_design_system/src/atoms/app_icon.dart';
import 'package:ecommerce_sample_design_system/src/atoms/app_text.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_icons.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:ecommerce_sample_design_system/src/molecules/app_search_bar.dart';
import 'package:flutter/material.dart';

/// [CustomAppBar] es un organismo que funciona como una AppBar personalizada.
///
/// Puede mostrar un título o una barra de búsqueda, y soporta un ícono
/// a la izquierda (leading) y una lista de acciones a la derecha.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// El widget que se muestra antes del título. Típicamente un [AppIcon] o [IconButton].
  final Widget? leading;

  /// El texto del título que se muestra cuando [showSearchBar] es `false`.
  final String? title;

  /// Una lista de widgets para mostrar después del título.
  final List<Widget>? actions;

  /// Si es `true`, muestra [AppSearchBar] en lugar del título.
  final bool showSearchBar;

  /// El texto de sugerencia para la barra de búsqueda.
  final String? searchHintText;

  /// El controlador para la barra de búsqueda.
  final TextEditingController? searchController;

  /// Callback para cuando el texto de búsqueda cambia.
  final ValueChanged<String>? onSearchChanged;

  /// Crea una AppBar personalizada.
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.showSearchBar = false,
    this.searchHintText,
    this.searchController,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.textDark,
      leading: leading ??
          const AppIcon(
            iconData: AppIcons.menu,
            color: AppColors.textDark,
          ),
      title: showSearchBar
          ? AppSearchBar(
              controller: searchController,
              hintText: searchHintText,
              onChanged: onSearchChanged,
            )
          : AppText(text: title ?? '', style: AppTextStyles.headline2),
      centerTitle: true,
      actions: actions,
    );
  }

  /// El tamaño preferido para este widget. La altura es `kToolbarHeight`.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
