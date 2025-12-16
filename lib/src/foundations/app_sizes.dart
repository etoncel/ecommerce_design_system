// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/tokens/app_sizing_tokens.dart';

/// La clase `AppSizes` proporciona valores de tamaño para elementos UI.
///
/// Esta clase consume los tokens de tamaño de `AppSizingTokens` para crear
/// constantes de tamaño para componentes como botones, iconos, y bordes.
class AppSizes {
  /// Tamaño extra extra pequeño para elementos UI (4.0).
  static const double sXXS = AppSizingTokens.sizingXxs;

  /// Tamaño extra pequeño para elementos UI (8.0).
  static const double sXS = AppSizingTokens.sizingXs;

  /// Tamaño pequeño para elementos UI (16.0).
  static const double sS = AppSizingTokens.sizingS;

  /// Tamaño mediano para elementos UI (24.0).
  static const double sM = AppSizingTokens.sizingM;

  /// Tamaño grande para elementos UI (32.0).
  static const double sL = AppSizingTokens.sizingL;
}
