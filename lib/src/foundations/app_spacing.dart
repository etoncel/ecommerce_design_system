// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/tokens/app_sizing_tokens.dart';
import 'package:flutter/material.dart';

/// La clase `AppSpacing` proporciona valores de espaciado y `SizedBox` preconfigurados.
///
/// Esta clase consume los tokens de tamaño de `AppSizingTokens` para crear
/// constantes de espaciado y widgets `SizedBox` que se pueden reutilizar en
/// toda la aplicación para mantener un espaciado consistente.
class AppSpacing {
  /// Espaciado de 4.0.
  static const double spaceXxs = AppSizingTokens.sizingXxs;

  /// Espaciado de 8.0.
  static const double spaceXs = AppSizingTokens.sizingXs;

  /// Espaciado de 16.0.
  static const double spaceS = AppSizingTokens.sizingS;

  /// Espaciado de 24.0.
  static const double spaceM = AppSizingTokens.sizingM;

  /// Espaciado de 32.0.
  static const double spaceL = AppSizingTokens.sizingL;

  /// SizedBox con un ancho de 4.0.
  static const Widget horizontalXxs = SizedBox(width: spaceXxs);

  /// SizedBox con un ancho de 8.0.
  static const Widget horizontalXs = SizedBox(width: spaceXs);

  /// SizedBox con un ancho de 16.0.
  static const Widget horizontalS = SizedBox(width: spaceS);

  /// SizedBox con un ancho de 24.0.
  static const Widget horizontalM = SizedBox(width: spaceM);

  /// SizedBox con un ancho de 32.0.
  static const Widget horizontalL = SizedBox(width: spaceL);

  /// SizedBox con una altura de 4.0.
  static const Widget verticalXxs = SizedBox(height: spaceXxs);

  /// SizedBox con una altura de 8.0.
  static const Widget verticalXs = SizedBox(height: spaceXs);

  /// SizedBox con una altura de 16.0.
  static const Widget verticalS = SizedBox(height: spaceS);

  /// SizedBox con una altura de 24.0.
  static const Widget verticalM = SizedBox(height: spaceM);

  /// SizedBox con una altura de 32.0.
  static const Widget verticalL = SizedBox(height: spaceL);
}
