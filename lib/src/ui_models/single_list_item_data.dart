// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// Clase de datos genérica para un elemento de una lista.
class SingleListItemData {
  /// Crea una instancia de datos de elemento de lista.
  const SingleListItemData({
    required this.imageUrl,
    required this.itemName,
    this.onTap,
  });

  /// La URL de la imagen del elemento.
  final String imageUrl;

  /// El nombre del elemento.
  final String itemName;

  /// Callback opcional para cuando se toca el elemento.
  final VoidCallback? onTap;
}
