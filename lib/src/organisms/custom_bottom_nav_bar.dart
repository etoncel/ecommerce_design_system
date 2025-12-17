import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:flutter/material.dart';

/// [CustomBottomNavBar] es un organismo que proporciona una barra de navegación
/// inferior estilizada para la aplicación.
///
/// Envuelve el widget [BottomNavigationBar] de Flutter y aplica los colores
/// y estilos del sistema de diseño. El estado (el ítem actual seleccionado)
/// debe ser gestionado por un widget padre.
class CustomBottomNavBar extends StatelessWidget {
  /// El índice del ítem de navegación que está actualmente seleccionado.
  final int currentIndex;

  /// La lista de items que se mostrarán en la barra de navegación.
  /// Se recomienda usar [BottomNavigationBarItem] con [AppIcon] para el ícono.
  final List<BottomNavigationBarItem> items;

  /// Callback que se ejecuta cuando se toca un ítem.
  final ValueChanged<int> onTap;

  /// Crea una barra de navegación inferior personalizada.
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textLight,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 8.0,
    );
  }
}
