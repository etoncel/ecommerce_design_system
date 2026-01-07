import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilterButton Property Tests', () {
    /// **Feature: adaptive-search-filters, Property 3: Mobile Filter Button States**
    /// *For any* mobile layout, the FilterButton should display "Filter" text with filter icon
    /// when no filter is selected, and display the selected category name with close icon
    /// when a filter is active
    /// **Validates: Requirements 2.1, 2.2, 2.3, 2.5**

    group('Default State (No Filter Selected)', () {
      testWidgets(
        'should display "Filter" text with filter icon when no filter selected',
        (tester) async {
          // Arrange

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: null,
                hasActiveFilter: false,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text('Filter'),
            findsOneWidget,
            reason: 'Should display "Filter" text in default state',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsOneWidget,
            reason: 'Should display filter icon in default state',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsNothing,
            reason: 'Should not display close icon in default state',
          );
        },
      );

      testWidgets(
        'should display "Filter" text with filter icon when selectedFilter is empty string',
        (tester) async {
          // Arrange

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: '',
                hasActiveFilter: false,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text('Filter'),
            findsOneWidget,
            reason: 'Should display "Filter" text when selectedFilter is empty',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsOneWidget,
            reason: 'Should display filter icon when selectedFilter is empty',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsNothing,
            reason:
                'Should not display close icon when selectedFilter is empty',
          );
        },
      );

      testWidgets(
        'should display "Filter" text with filter icon when hasActiveFilter is false regardless of selectedFilter',
        (tester) async {
          // Arrange

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: 'Electronics',
                hasActiveFilter: false,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text('Filter'),
            findsOneWidget,
            reason:
                'Should display "Filter" text when hasActiveFilter is false',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsOneWidget,
            reason: 'Should display filter icon when hasActiveFilter is false',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsNothing,
            reason:
                'Should not display close icon when hasActiveFilter is false',
          );
        },
      );
    });

    group('Active State (Filter Selected)', () {
      testWidgets(
        'should display category name with close icon when filter is active - Electronics',
        (tester) async {
          // Arrange
          const categoryName = 'Electronics';

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: categoryName,
                hasActiveFilter: true,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text(categoryName),
            findsOneWidget,
            reason: 'Should display selected category name in active state',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsOneWidget,
            reason: 'Should display close icon in active state',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsNothing,
            reason: 'Should not display filter icon in active state',
          );
          expect(
            find.text('Filter'),
            findsNothing,
            reason: 'Should not display "Filter" text in active state',
          );
        },
      );

      testWidgets(
        'should display category name with close icon when filter is active - Clothing',
        (tester) async {
          // Arrange
          const categoryName = 'Clothing';

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: categoryName,
                hasActiveFilter: true,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text(categoryName),
            findsOneWidget,
            reason: 'Should display selected category name in active state',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsOneWidget,
            reason: 'Should display close icon in active state',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsNothing,
            reason: 'Should not display filter icon in active state',
          );
          expect(
            find.text('Filter'),
            findsNothing,
            reason: 'Should not display "Filter" text in active state',
          );
        },
      );

      testWidgets(
        'should display category name with close icon when filter is active - Books',
        (tester) async {
          // Arrange
          const categoryName = 'Books';

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: categoryName,
                hasActiveFilter: true,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text(categoryName),
            findsOneWidget,
            reason: 'Should display selected category name in active state',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsOneWidget,
            reason: 'Should display close icon in active state',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsNothing,
            reason: 'Should not display filter icon in active state',
          );
          expect(
            find.text('Filter'),
            findsNothing,
            reason: 'Should not display "Filter" text in active state',
          );
        },
      );

      testWidgets(
        'should display category name with close icon when filter is active - Long Category Name',
        (tester) async {
          // Arrange
          const categoryName = 'Home & Garden Supplies';

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: categoryName,
                hasActiveFilter: true,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.text(categoryName),
            findsOneWidget,
            reason: 'Should display selected category name in active state',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsOneWidget,
            reason: 'Should display close icon in active state',
          );
          expect(
            find.byIcon(AppIcons.filter),
            findsNothing,
            reason: 'Should not display filter icon in active state',
          );
          expect(
            find.text('Filter'),
            findsNothing,
            reason: 'Should not display "Filter" text in active state',
          );
        },
      );
    });

    group('Button Interaction', () {
      testWidgets(
        'should call onTap callback when button is tapped in default state',
        (tester) async {
          // Arrange
          bool buttonTapped = false;

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () => buttonTapped = true,
                selectedFilter: null,
                hasActiveFilter: false,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          await tester.tap(find.byType(FilterButton));
          await tester.pumpAndSettle();

          // Assert
          expect(
            buttonTapped,
            true,
            reason: 'Should call onTap callback when button is tapped',
          );
        },
      );

      testWidgets(
        'should call onTap callback when button is tapped in active state',
        (tester) async {
          // Arrange
          bool buttonTapped = false;

          final testWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () => buttonTapped = true,
                selectedFilter: 'Electronics',
                hasActiveFilter: true,
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.pumpAndSettle();

          await tester.tap(find.byType(FilterButton));
          await tester.pumpAndSettle();

          // Assert
          expect(
            buttonTapped,
            true,
            reason:
                'Should call onTap callback when button is tapped in active state',
          );
        },
      );
    });

    /// **Feature: adaptive-search-filters, Property 10: Keyboard Accessibility**
    /// *For any* FilterButton, it should be focusable and activatable with Enter/Space keys,
    /// and should have appropriate accessibility labels for screen readers
    /// **Validates: Requirements 6.1, 6.4**

    group('Keyboard Accessibility', () {
      testWidgets('should be focusable and show focus indicator', (
        tester,
      ) async {
        // Arrange

        final testWidget = MaterialApp(
          home: Scaffold(
            body: FilterButton(
              onTap: () {},
              selectedFilter: null,
              hasActiveFilter: false,
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Button border without focus
        final defaultContainer = tester.widget<Container>(
          find
              .descendant(
                of: find.byType(FilterButton),
                matching: find.byType(Container),
              )
              .first,
        );

        // Border side color before focus
        expect(
          (defaultContainer.decoration as BoxDecoration).border?.bottom.color,
          equals(AppColors.textLight),
          reason: 'BorderSide should be AppColors.textLight when has no focus',
        );

        // Get the FilterButton widget and request focus
        final filterButton = find.byType(FilterButton);
        await tester.tap(filterButton);
        await tester.pumpAndSettle();

        // Assert - Check that the button can receive focus
        expect(
          filterButton,
          findsOneWidget,
          reason: 'FilterButton should be present and focusable',
        );

        // Button border with focus
        final focusedContainer = tester.widget<Container>(
          find
              .descendant(
                of: find.byType(FilterButton),
                matching: find.byType(Container),
              )
              .first,
        );

        // BorderSide color with focus after the tap
        expect(
          (focusedContainer.decoration as BoxDecoration).border?.bottom.color,
          equals(AppColors.primary),
          reason: 'BorderSide should be AppColors.primary when focused',
        );
      });

      testWidgets('should activate with Enter key in default state', (
        tester,
      ) async {
        // Arrange
        bool buttonTapped = false;

        final testWidget = MaterialApp(
          home: Scaffold(
            body: FilterButton(
              onTap: () => buttonTapped = true,
              selectedFilter: null,
              hasActiveFilter: false,
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Focus the button by tapping it first
        await tester.tap(find.byType(FilterButton));
        await tester.pumpAndSettle();

        // Reset the tap flag and test keyboard activation
        buttonTapped = false;
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();

        // Assert
        expect(
          buttonTapped,
          true,
          reason: 'Should activate FilterButton with Enter key',
        );
      });

      testWidgets('should activate with Space key in active state', (
        tester,
      ) async {
        // Arrange
        bool buttonTapped = false;

        final testWidget = MaterialApp(
          home: Scaffold(
            body: FilterButton(
              onTap: () => buttonTapped = true,
              selectedFilter: 'Electronics',
              hasActiveFilter: true,
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Focus the button by tapping it first
        await tester.tap(find.byType(FilterButton));
        await tester.pumpAndSettle();

        // Reset the tap flag and test keyboard activation
        buttonTapped = false;
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pumpAndSettle();

        // Assert
        expect(
          buttonTapped,
          true,
          reason: 'Should activate FilterButton with Space key',
        );
      });
    });

    group('Accessibility Labels', () {
      testWidgets('should have appropriate semantic label for default state', (
        tester,
      ) async {
        // Arrange
        final testWidget = MaterialApp(
          home: Scaffold(
            body: FilterButton(
              onTap: () {},
              selectedFilter: null,
              hasActiveFilter: false,
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        final semantics = tester.getSemantics(find.byType(FilterButton));
        expect(
          semantics.label,
          contains('Open category filters'),
          reason: 'Should contain appropriate semantic label for default state',
        );
        expect(
          semantics.flagsCollection.isButton,
          true,
          reason: 'Should be marked as button for screen readers',
        );
      });

      testWidgets('should have appropriate semantic label for active state', (
        tester,
      ) async {
        // Arrange
        const categoryName = 'Electronics';

        final testWidget = MaterialApp(
          home: Scaffold(
            body: FilterButton(
              onTap: () {},
              selectedFilter: categoryName,
              hasActiveFilter: true,
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        final semantics = tester.getSemantics(find.byType(FilterButton));
        expect(
          semantics.label,
          contains('Clear filter: $categoryName'),
          reason: 'Should contain appropriate semantic label for active state',
        );
        expect(
          semantics.flagsCollection.isButton,
          true,
          reason: 'Should be marked as button for screen readers',
        );
      });

      testWidgets('should use custom semantic label when provided', (
        tester,
      ) async {
        // Arrange
        const customLabel = 'Custom filter button label';

        final testWidget = MaterialApp(
          home: Scaffold(
            body: FilterButton(
              onTap: () {},
              selectedFilter: null,
              hasActiveFilter: false,
              semanticLabel: customLabel,
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.pumpAndSettle();

        // Assert
        final semantics = tester.getSemantics(find.byType(FilterButton));
        expect(
          semantics.label,
          contains(customLabel),
          reason: 'Should contain custom semantic label when provided',
        );
      });
    });

    group('Visual State Changes', () {
      testWidgets(
        'should show visual differences between default and active states',
        (tester) async {
          // Arrange - Default state
          final defaultWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: null,
                hasActiveFilter: false,
              ),
            ),
          );

          // Act - Test default state
          await tester.pumpWidget(defaultWidget);
          await tester.pumpAndSettle();

          // Get default state container
          final defaultContainer = tester.widget<Container>(
            find
                .descendant(
                  of: find.byType(FilterButton),
                  matching: find.byType(Container),
                )
                .first,
          );

          // Arrange - Active state
          final activeWidget = MaterialApp(
            home: Scaffold(
              body: FilterButton(
                onTap: () {},
                selectedFilter: 'Electronics',
                hasActiveFilter: true,
              ),
            ),
          );

          // Act - Test active state
          await tester.pumpWidget(activeWidget);
          await tester.pumpAndSettle();

          // Get active state container
          final activeContainer = tester.widget<Container>(
            find
                .descendant(
                  of: find.byType(FilterButton),
                  matching: find.byType(Container),
                )
                .first,
          );

          // Assert
          expect(
            (defaultContainer.decoration as BoxDecoration).color,
            Colors.transparent,
            reason: 'Default state should have transparent background',
          );

          // Check that active state has some background color (not transparent)
          final activeColor =
              (activeContainer.decoration as BoxDecoration).color;
          expect(
            activeColor != Colors.transparent,
            true,
            reason: 'Active state should have non-transparent background',
          );
        },
      );
    });
  });
}
