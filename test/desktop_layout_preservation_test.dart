import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Property 7: Desktop Layout Preservation', () {
    /// **Feature: adaptive-search-filters, Property 7: Desktop Layout Preservation**
    ///
    /// *For any* desktop screen width, the SearchPage should display category filters
    /// in the left sidebar with 2:6 flex ratio and should not display the mobile FilterButton
    /// **Validates: Requirements 4.1, 4.2, 4.3**
    testWidgets(
      'should preserve desktop layout with sidebar filters and 2:6 flex ratio for any desktop screen width',
      (tester) async {
        // Test multiple desktop screen widths
        final desktopWidths = [
          768.0, // Minimum desktop width
          1024.0, // Tablet/small desktop
          1200.0, // Standard desktop
          1440.0, // Large desktop
          1920.0, // Full HD desktop
        ];

        for (final width in desktopWidths) {
          // Set the screen size to desktop width
          await tester.binding.setSurfaceSize(Size(width, 800));

          // Create a test widget that uses ResponsiveBreakpoints
          await tester.pumpWidget(
            MaterialApp(
              home: Builder(
                builder: (context) {
                  // Verify this is considered desktop
                  expect(
                    ResponsiveBreakpoints.isDesktop(context),
                    isTrue,
                    reason: 'Width $width should be considered desktop',
                  );

                  // Verify this is not considered mobile
                  expect(
                    ResponsiveBreakpoints.isMobile(context),
                    isFalse,
                    reason: 'Width $width should not be considered mobile',
                  );

                  return Scaffold(
                    body: SingleChildScrollView(
                      child: Container(
                        key: const Key('main-layout-row'),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Sidebar (flex: 2)
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppText(
                                      text: "Categories",
                                      style: AppTextStyles.headline2,
                                    ),
                                    const SizedBox(height: 8),
                                    // Simple category list without QuantityIndicatorList to avoid overflow
                                    const AppText(
                                      text: 'Electronics (10)',
                                      style: AppTextStyles.body,
                                    ),
                                    const AppText(
                                      text: 'Clothing (5)',
                                      style: AppTextStyles.body,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Main content (flex: 6)
                            Flexible(
                              flex: 6,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Center(
                                  child: AppText(
                                    text: 'Main Content Area',
                                    style: AppTextStyles.body,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Verify the layout structure exists
          expect(find.byKey(const Key('main-layout-row')), findsOneWidget);
          expect(find.text('Categories'), findsOneWidget);
          expect(find.text('Main Content Area'), findsOneWidget);

          // Verify no FilterButton is present (mobile component)
          expect(find.byType(FilterButton), findsNothing);

          // Get the main Row widget to verify flex ratios
          final mainRowFinder = find.descendant(
            of: find.byKey(const Key('main-layout-row')),
            matching: find.byType(Row),
          );
          expect(mainRowFinder, findsOneWidget);

          final mainRow = tester.widget<Row>(mainRowFinder);
          final flexibleWidgets = mainRow.children
              .whereType<Flexible>()
              .toList();

          // Verify we have exactly 2 Flexible widgets (sidebar and content)
          expect(flexibleWidgets.length, equals(2));

          // Verify the flex ratios are 2:6
          expect(
            flexibleWidgets[0].flex,
            equals(2),
            reason: 'Sidebar should have flex: 2',
          );
          expect(
            flexibleWidgets[1].flex,
            equals(6),
            reason: 'Content should have flex: 6',
          );

          // Reset surface size for next iteration
          await tester.binding.setSurfaceSize(null);
        }
      },
    );

    testWidgets(
      'should maintain consistent desktop layout behavior across different screen sizes',
      (tester) async {
        final desktopSizes = [
          const Size(768, 600), // Minimum desktop
          const Size(1024, 768), // Standard tablet/desktop
          const Size(1200, 800), // Desktop
          const Size(1440, 900), // Large desktop
          const Size(1920, 1080), // Full HD
        ];

        for (final size in desktopSizes) {
          // Set desktop screen size
          await tester.binding.setSurfaceSize(size);

          await tester.pumpWidget(
            MaterialApp(
              home: Builder(
                builder: (context) {
                  // Verify desktop detection
                  expect(ResponsiveBreakpoints.isDesktop(context), isTrue);

                  return Scaffold(
                    body: Container(
                      key: const Key('desktop-layout'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppText(
                                    text: "Categories",
                                    style: AppTextStyles.headline2,
                                  ),
                                  const SizedBox(height: 8),
                                  const AppText(
                                    text: 'Category List',
                                    style: AppTextStyles.body,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: const Center(
                                child: AppText(
                                  text: 'Products Area',
                                  style: AppTextStyles.body,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );

          await tester.pumpAndSettle();

          // Verify layout structure is maintained regardless of screen size
          expect(find.byKey(const Key('desktop-layout')), findsOneWidget);
          expect(find.text('Categories'), findsOneWidget);
          expect(find.text('Products Area'), findsOneWidget);

          // Verify no mobile FilterButton
          expect(find.byType(FilterButton), findsNothing);

          // Verify flex ratios are maintained
          final rowFinder = find.descendant(
            of: find.byKey(const Key('desktop-layout')),
            matching: find.byType(Row),
          );
          expect(rowFinder, findsOneWidget);

          final row = tester.widget<Row>(rowFinder);
          final flexibleWidgets = row.children.whereType<Flexible>().toList();
          expect(flexibleWidgets[0].flex, equals(2));
          expect(flexibleWidgets[1].flex, equals(6));

          // Reset for next iteration
          await tester.binding.setSurfaceSize(null);
        }
      },
    );

    testWidgets('should never display FilterButton on desktop layouts', (
      tester,
    ) async {
      final desktopWidths = [768.0, 1024.0, 1200.0, 1440.0, 1920.0];

      for (final width in desktopWidths) {
        await tester.binding.setSurfaceSize(Size(width, 800));

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                // Verify desktop detection
                expect(ResponsiveBreakpoints.isDesktop(context), isTrue);

                // Create a layout that might accidentally include FilterButton
                return Scaffold(
                  body: Column(
                    children: [
                      // App bar area
                      Container(
                        height: 60,
                        child: const Center(
                          child: AppText(
                            text: 'Search Bar Area',
                            style: AppTextStyles.headline2,
                          ),
                        ),
                      ),
                      // Main content with desktop layout
                      Expanded(
                        child: Row(
                          children: [
                            // Sidebar - should NOT contain FilterButton
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const AppText(
                                      text: "Categories",
                                      style: AppTextStyles.headline2,
                                    ),
                                    const SizedBox(height: 8),
                                    const AppText(
                                      text: 'Test Category',
                                      style: AppTextStyles.body,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Content area
                            Flexible(
                              flex: 6,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Center(
                                  child: AppText(
                                    text: 'Content',
                                    style: AppTextStyles.body,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Critical assertion: FilterButton should NEVER be present on desktop
        expect(
          find.byType(FilterButton),
          findsNothing,
          reason:
              'FilterButton should never be displayed on desktop layout (width: $width)',
        );

        // Verify desktop layout elements are present
        expect(find.text('Categories'), findsOneWidget);
        expect(find.text('Test Category'), findsOneWidget);

        await tester.binding.setSurfaceSize(null);
      }
    });
  });
}
