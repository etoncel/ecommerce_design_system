# Sistema de Diseño E-commerce

Este paquete de Flutter (`ecommerce_sample_design_system`) proporciona un sistema de diseño basado en la metodología **Atomic Design** para construir aplicaciones de e-commerce de manera consistente y eficiente.

## Descripción

El objetivo de este paquete es centralizar todos los componentes visuales, desde los colores y estilos de texto más básicos (tokens) hasta componentes complejos como tarjetas de producto y barras de navegación (organismos). Esto asegura una UI/UX coherente, acelera el desarrollo y facilita el mantenimiento.

## Instalación

Para añadirlo a tu proyecto de Flutter agregando la siguiente dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  ecommerce_sample_design_system: <latest_version>

```

Luego, ejecuta `flutter pub get` en tu terminal.

## Uso

Para utilizar los componentes del sistema de diseño, primero importa el paquete en tu archivo Dart.

```dart
import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
```

### Ejemplos de Widgets

A continuación se muestran algunos ejemplos de cómo usar los widgets más comunes.

#### AppButton

Crea botones consistentes con estilos primario y secundario.

```dart
Column(
  children: [
    AppButton.primary(
      text: 'Añadir al Carrito',
      onPressed: () {
        print('Botón primario presionado!');
      },
    ),
    SizedBox(height: 16),
    AppButton.secondary(
      text: 'Ver Detalles',
      onPressed: () {
        print('Botón secundario presionado!');
      },
    ),
  ],
)
```

#### ProductCard

Muestra una tarjeta de producto completa con imagen, nombre, precio y calificación.

```dart
ProductCard(
  imageUrl: 'https://via.placeholder.com/150',
  productName: 'Nombre del Producto',
  productPrice: '\$99.99',
  rating: 4.5,
  onTap: () {
    print('Tarjeta de producto presionada!');
  },
)
```

#### CustomAppBar y CustomBottomNavBar

Usa los organismos para construir el layout principal de una pantalla.

```dart
class MiPantalla extends StatefulWidget {
  @override
  _MiPantallaState createState() => _MiPantallaState();
}

class _MiPantallaState extends State<MiPantalla> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Mi Tienda',
        actions: [
          IconButton(
            icon: AppIcon(iconData: AppIcons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(child: Text('Contenido de la página')),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: AppIcon(iconData: AppIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(iconData: AppIcons.category),
            label: 'Categorías',
          ),
        ],
      ),
    );
  }
}
```

## Componentes Disponibles

### Tokens y Fundamentos
- **Colores**: `AppColors`
- **Tipografía**: `AppTextStyles`
- **Espaciado**: `AppSpacing`
- **Iconografía**: `AppIcons`
- **Tema Global**: `AppTheme`

### Átomos
- `AppButton`
- `AppText`
- `AppIcon`
- `AppCircularImage`
- `AppTag`
- `AppInput`

### Moléculas
- `AppSearchBar`
- `ProductRating`
- `CategoryItem`
- `QuantitySelector`

### Organismos
- `ProductCard`
- `HorizontalProductList`
- `CustomAppBar`
- `CustomBottomNavBar`

## Aplicación de Ejemplo

Este paquete incluye una aplicación de ejemplo completa en la carpeta `example/`. Para ver todos los componentes en acción:

1.  Navega a la carpeta `example/`.
2.  Asegúrate de que las dependencias estén instaladas con `flutter pub get`.
3.  Ejecuta la aplicación en un emulador o dispositivo con `flutter run`.

La app de ejemplo tiene un "showcase" para cada nivel de componente (átomos, moléculas y organismos).