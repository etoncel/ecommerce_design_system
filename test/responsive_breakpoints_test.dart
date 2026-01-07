import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveBreakpoints Property Tests', () {
    /// **Feature: adaptive-search-filters, Property 1: Responsive Layout Detection**
    /// *For any* screen width, when the SearchPage is displayed, the layout should match
    /// the appropriate breakpoint (mobile for < 768px, desktop for ≥ 768px)
    /// **Validates: Requirements 1.1, 1.2**

    group('Mobile Layout Detection (< 768px)', () {
      testWidgets('should detect iPhone SE (320px) as mobile', (tester) async {
        // Arrange
        late bool detectedMobile;

        tester.view.physicalSize = const Size(320, 568);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedMobile = ResponsiveBreakpoints.isMobile(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedMobile,
          true,
          reason: '320px should be detected as mobile',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect iPhone 8 (375px) as mobile', (tester) async {
        // Arrange
        late bool detectedMobile;

        tester.view.physicalSize = const Size(375, 667);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedMobile = ResponsiveBreakpoints.isMobile(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedMobile,
          true,
          reason: '375px should be detected as mobile',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect large phone (600px) as mobile', (
        tester,
      ) async {
        // Arrange
        late bool detectedMobile;

        tester.view.physicalSize = const Size(600, 800);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedMobile = ResponsiveBreakpoints.isMobile(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedMobile,
          true,
          reason: '600px should be detected as mobile',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect 767px as mobile (just below breakpoint)', (
        tester,
      ) async {
        // Arrange
        late bool detectedMobile;

        tester.view.physicalSize = const Size(767, 800);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedMobile = ResponsiveBreakpoints.isMobile(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedMobile,
          true,
          reason: '767px should be detected as mobile',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });
    });

    group('Desktop Layout Detection (≥ 768px)', () {
      testWidgets('should detect 768px as desktop (exact breakpoint)', (
        tester,
      ) async {
        // Arrange
        late bool detectedDesktop;

        tester.view.physicalSize = const Size(768, 800);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedDesktop = ResponsiveBreakpoints.isDesktop(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedDesktop,
          true,
          reason: '768px should be detected as desktop',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect iPad (1024px) as desktop', (tester) async {
        // Arrange
        late bool detectedDesktop;

        tester.view.physicalSize = const Size(1024, 768);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedDesktop = ResponsiveBreakpoints.isDesktop(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedDesktop,
          true,
          reason: '1024px should be detected as desktop',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect laptop (1440px) as desktop', (tester) async {
        // Arrange
        late bool detectedDesktop;

        tester.view.physicalSize = const Size(1440, 900);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedDesktop = ResponsiveBreakpoints.isDesktop(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedDesktop,
          true,
          reason: '1440px should be detected as desktop',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect large desktop (1920px) as desktop', (
        tester,
      ) async {
        // Arrange
        late bool detectedDesktop;

        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedDesktop = ResponsiveBreakpoints.isDesktop(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedDesktop,
          true,
          reason: '1920px should be detected as desktop',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });
    });

    group('Tablet Detection (768px - 1023px)', () {
      testWidgets('should detect 768px as tablet', (tester) async {
        // Arrange
        late bool detectedTablet;

        tester.view.physicalSize = const Size(768, 1024);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedTablet = ResponsiveBreakpoints.isTablet(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedTablet,
          true,
          reason: '768px should be detected as tablet',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect 1023px as tablet', (tester) async {
        // Arrange
        late bool detectedTablet;

        tester.view.physicalSize = const Size(1023, 768);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedTablet = ResponsiveBreakpoints.isTablet(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedTablet,
          true,
          reason: '1023px should be detected as tablet',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });
    });

    group('Large Desktop Detection (≥ 1200px)', () {
      testWidgets('should detect 1200px as large desktop', (tester) async {
        // Arrange
        late bool detectedLargeDesktop;

        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedLargeDesktop = ResponsiveBreakpoints.isLargeDesktop(
                context,
              );
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedLargeDesktop,
          true,
          reason: '1200px should be detected as large desktop',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should detect 2560px as large desktop', (tester) async {
        // Arrange
        late bool detectedLargeDesktop;

        tester.view.physicalSize = const Size(2560, 1440);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedLargeDesktop = ResponsiveBreakpoints.isLargeDesktop(
                context,
              );
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedLargeDesktop,
          true,
          reason: '2560px should be detected as large desktop',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });
    });

    group('Screen Dimensions Helper', () {
      testWidgets('should return correct screen width and height', (
        tester,
      ) async {
        // Arrange
        late double detectedWidth;
        late double detectedHeight;
        const testSize = Size(1024, 768);

        tester.view.physicalSize = testSize;
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              detectedWidth = ResponsiveBreakpoints.getScreenWidth(context);
              detectedHeight = ResponsiveBreakpoints.getScreenHeight(context);
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          detectedWidth,
          testSize.width,
          reason: 'Should correctly detect screen width',
        );
        expect(
          detectedHeight,
          testSize.height,
          reason: 'Should correctly detect screen height',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });
    });

    group('Responsive Helper Method', () {
      testWidgets('should return mobile value for mobile screen', (
        tester,
      ) async {
        // Arrange
        late String responsiveValue;

        tester.view.physicalSize = const Size(320, 568);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              responsiveValue = ResponsiveBreakpoints.responsive<String>(
                context,
                mobile: 'mobile',
                tablet: 'tablet',
                desktop: 'desktop',
              );
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          responsiveValue,
          'mobile',
          reason: 'Mobile screen should return mobile value',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should return tablet value for tablet screen', (
        tester,
      ) async {
        // Arrange
        late String responsiveValue;

        tester.view.physicalSize = const Size(800, 600);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              responsiveValue = ResponsiveBreakpoints.responsive<String>(
                context,
                mobile: 'mobile',
                tablet: 'tablet',
                desktop: 'desktop',
              );
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          responsiveValue,
          'tablet',
          reason: 'Tablet screen should return tablet value',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets('should return desktop value for desktop screen', (
        tester,
      ) async {
        // Arrange
        late String responsiveValue;

        tester.view.physicalSize = const Size(1440, 900);
        tester.view.devicePixelRatio = 1.0;

        final testWidget = MaterialApp(
          home: Builder(
            builder: (context) {
              responsiveValue = ResponsiveBreakpoints.responsive<String>(
                context,
                mobile: 'mobile',
                tablet: 'tablet',
                desktop: 'desktop',
              );
              return Container();
            },
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        expect(
          responsiveValue,
          'desktop',
          reason: 'Desktop screen should return desktop value',
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      });

      testWidgets(
        'should fallback to mobile when tablet/desktop not provided',
        (tester) async {
          // Arrange
          late String responsiveValue;

          tester.view.physicalSize = const Size(1200, 800);
          tester.view.devicePixelRatio = 1.0;

          final testWidget = MaterialApp(
            home: Builder(
              builder: (context) {
                responsiveValue = ResponsiveBreakpoints.responsive<String>(
                  context,
                  mobile: 'fallback',
                  // No tablet or desktop provided
                );
                return Container();
              },
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            responsiveValue,
            'fallback',
            reason: 'Should fallback to mobile value when desktop not provided',
          );

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });
        },
      );
    });
  });
}
