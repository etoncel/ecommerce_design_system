## 0.0.4

### Añadido
- Añadido el parámetro de tamaño al `AppButton`.
- Añadido el nuevo átomo `AppImage`.
- Añadidos tokens de tipografía.

### Modificado
- Cambiado el color de fondo y refactorizado el `borderRadius` del `AppInput`.
- Modificado el botón de la barra de búsqueda para incluir `padding`.
- Modificada la restricción de ancho de la barra de aplicación personalizada para la barra de búsqueda.
- Cambiados los tokens de color para los colores `primary`, `second` y `textDark`.
- Añadido el nuevo estilo de texto `smallButton`.

## 0.0.3 

### Modificado
- Se renombró el elemento de la tarjeta. Se creó una lista para los elementos. Se renombró la documentación.

## 0.0.2 

### Modificado
- Se modifican los ejemplos de los foundations de espaciado y tamaño en el showcase para que sean más fáciles de visualizar.

## 0.0.1 - Versión Inicial

### Añadido

- **Estructura del Proyecto**: Se ha configurado la estructura inicial del paquete siguiendo la metodología Atomic Design, con carpetas para `tokens`, `foundations`, `atoms`, `molecules`, y `organisms`.

- **Tokens y Fundamentos**:
  - Definición de tokens de diseño para colores, tipografía y tamaños.
  - Creación de clases de fundamentos (`AppColors`, `AppTextStyles`, `AppSpacing`, `AppIcons`, `AppTheme`) para consumir los tokens.

- **Componentes de Átomos**:
  - `AppButton`: Botón con estilos primario y secundario.
  - `AppText`: Wrapper para texto con estilos predefinidos.
  - `AppIcon`: Componente para mostrar íconos de manera consistente.
  - `AppCircularImage`: Widget para imágenes circulares.
  - `AppTag`: Etiqueta de texto con fondo de color.
  - `AppInput`: Campo de texto estilizado.

- **Componentes de Moléculas**:
  - `AppSearchBar`: Barra de búsqueda con ícono.
  - `ProductRating`: Indicador de calificación de producto con estrellas.
  - `CategoryItem`: Componente para mostrar categorías.
  - `QuantitySelector`: Selector de cantidad con botones de +/-.

- **Componentes de Organismos**:
  - `ProductCard`: Tarjeta de producto completa.
  - `HorizontalProductList`: Lista de productos con scroll horizontal.
  - `CustomAppBar`: Barra de aplicación personalizada.
  - `CustomBottomNavBar`: Barra de navegación inferior personalizada.

- **Aplicación de Ejemplo**:
  - Creación de una aplicación de ejemplo en la carpeta `example/` para mostrar todos los componentes del sistema de diseño.
  - Pantallas de showcase para Fundamentos, Átomos, Moléculas y Organismos.

- **Documentación**:
  - Creación de `README.md` principal con instrucciones de instalación y uso.
  - Creación de `README.md` para la aplicación de ejemplo.
  - Actualización de este `CHANGELOG.md`.