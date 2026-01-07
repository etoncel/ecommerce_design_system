import 'package:flutter/material.dart';
import 'app_breakpoints.dart';

/// Utility class for responsive breakpoint detection and helper methods
class ResponsiveBreakpoints {
  /// Private constructor to prevent instantiation
  ResponsiveBreakpoints._();

  /// Checks if the current screen width is mobile (< 768px)
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppBreakpoints.mobile;
  }

  /// Checks if the current screen width is tablet (>= 768px and < 1024px)
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet;
  }

  /// Checks if the current screen width is desktop (>= 768px)
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppBreakpoints.mobile;
  }

  /// Checks if the current screen width is large desktop (>= 1200px)
  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppBreakpoints.desktop;
  }

  /// Gets the current screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the current screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns a value based on the current breakpoint
  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isMobile(context)) {
      return mobile;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else if (desktop != null) {
      return desktop;
    }
    return mobile;
  }
}
