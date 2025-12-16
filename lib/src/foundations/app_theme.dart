// ignore_for_file: public_member_api_docs

import 'package:ecommerce_sample_design_system/src/foundations/app_colors.dart';
import 'package:ecommerce_sample_design_system/src/foundations/app_text_styles.dart';
import 'package:flutter/material.dart';

/// La clase `AppTheme` proporciona un `ThemeData` global para la aplicación.
///
/// Esta clase consume las clases de fundamentos `AppColors` y `AppTextStyles`
/// para configurar un tema coherente que se puede aplicar a toda la aplicación.
class AppTheme {
  /// El `ThemeData` global para la aplicación.
  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.background,
          error: Colors.red,
          onPrimary: AppColors.white,
          onSecondary: AppColors.black,
          onSurface: AppColors.textDark,
          onError: AppColors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.headline1,
          displayMedium: AppTextStyles.headline2,
          bodyLarge: AppTextStyles.body,
          bodyMedium: AppTextStyles.caption,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            textStyle: AppTextStyles.button,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textDark,
        ),
      );
}
