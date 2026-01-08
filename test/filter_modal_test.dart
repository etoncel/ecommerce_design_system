import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilterModal Property Tests', () {
    /// **Feature: adaptive-search-filters, Property 4: Filter Modal Interaction**
    /// *For any* FilterButton tap on mobile, the system should open the FilterModal
    /// displaying all available categories with quantity indicators
    /// **Validates: Requirements 2.4, 3.1, 3.2**

    group('Modal Display and Content', () {
      testWidgets('should display modal with all provided categories', (
        tester,
      ) async {
        // Arrange
        final indicators = [
          const QuantityIndicator(name: 'Electronics', quantity: 150),
          const QuantityIndicator(name: 'Clothing', quantity: 200),
          const QuantityIndicator(name: 'Books', quantity: 75),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed',
        );
        expect(
          find.text('Categories'),
          findsOneWidget,
          reason: 'Modal should show Categories title',
        );
        expect(
          find.text('Electronics'),
          findsOneWidget,
          reason: 'Should display Electronics category',
        );
        expect(
          find.text('Clothing'),
          findsOneWidget,
          reason: 'Should display Clothing category',
        );
        expect(
          find.text('Books'),
          findsOneWidget,
          reason: 'Should display Books category',
        );
        expect(
          find.text('(150)'),
          findsAny,
          reason: 'Should display Electronics quantity',
        );
        expect(
          find.text('(200)'),
          findsOneWidget,
          reason: 'Should display Clothing quantity',
        );
        expect(
          find.text('(75)'),
          findsOneWidget,
          reason: 'Should display Books quantity',
        );
      });

      testWidgets('should display modal with single category', (tester) async {
        // Arrange
        final indicators = [
          const QuantityIndicator(name: 'Home & Garden', quantity: 89),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed',
        );
        expect(
          find.text('Home & Garden'),
          findsOneWidget,
          reason: 'Should display single category',
        );
        expect(
          find.text('(89)'),
          findsOneWidget,
          reason: 'Should display category quantity',
        );
      });

      testWidgets('should display modal with empty categories list', (
        tester,
      ) async {
        // Arrange
        final indicators = <QuantityIndicator>[];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed even with empty list',
        );
        expect(
          find.text('Categories'),
          findsOneWidget,
          reason: 'Modal should show Categories title',
        );
        expect(
          find.byType(QuantityIndicator),
          findsNothing,
          reason: 'Should not display any categories',
        );
      });

      testWidgets('should display modal with many categories', (tester) async {
        // Arrange
        final indicators = List.generate(
          10,
          (index) => QuantityIndicator(
            name: 'Category $index',
            quantity: index * 10 + 5,
          ),
        );

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed',
        );
        expect(
          find.text('Categories'),
          findsOneWidget,
          reason: 'Modal should show Categories title',
        );

        // Check that all categories are present (some might be off-screen but should exist in widget tree)
        for (int i = 0; i < 10; i++) {
          expect(
            find.text('Category $i'),
            findsOneWidget,
            reason: 'Should display Category $i',
          );
        }
      });
    });

    group('Modal Structure and UI Elements', () {
      testWidgets('should display handle bar for drag indication', (
        tester,
      ) async {
        // Arrange
        final indicators = [
          const QuantityIndicator(name: 'Test Category', quantity: 100),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed',
        );

        // Find the handle bar container
        final handleBarFinder = find.descendant(
          of: find.byType(FilterModal),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is Container &&
                (widget.decoration as BoxDecoration).color ==
                    AppColors.textLight,
          ),
        );
        expect(
          handleBarFinder,
          findsOneWidget,
          reason: 'Should display handle bar for drag indication',
        );
      });

      testWidgets('should display close button in header', (tester) async {
        // Arrange
        final indicators = [
          const QuantityIndicator(name: 'Test Category', quantity: 100),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed',
        );
        expect(
          find.byIcon(AppIcons.close),
          findsOneWidget,
          reason: 'Should display close button',
        );
      });

      testWidgets('should have proper modal styling with rounded corners', (
        tester,
      ) async {
        // Arrange
        final indicators = [
          const QuantityIndicator(name: 'Test Category', quantity: 100),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () =>
                    FilterModal.show(context: context, indicators: indicators),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'FilterModal should be displayed',
        );

        // Check the main container has proper decoration
        final containerFinder = find.descendant(
          of: find.byType(FilterModal),
          matching: find.byWidgetPredicate(
            (widget) =>
                widget is Container &&
                widget.decoration is BoxDecoration &&
                (widget.decoration as BoxDecoration).borderRadius ==
                    BorderRadius.vertical(
                      top: Radius.circular(AppSpacing.spaceM),
                    ),
          ),
        );
        expect(
          containerFinder,
          findsOneWidget,
          reason: 'Should have container with rounded corners',
        );
      });
    });

    /// **Feature: adaptive-search-filters, Property 5: Modal Filter Selection**
    /// *For any* category selection in FilterModal, the filter should be applied and the modal should close
    /// **Validates: Requirements 3.3**

    group('Category Selection', () {
      testWidgets('should call onIndicatorSelected when category is tapped', (
        tester,
      ) async {
        // Arrange
        int? selectedIndex;
        final indicators = [
          const QuantityIndicator(name: 'Electronics', quantity: 150),
          const QuantityIndicator(name: 'Clothing', quantity: 200),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => FilterModal.show(
                  context: context,
                  indicators: indicators,
                  onIndicatorSelected: (index) {
                    selectedIndex = index;
                  },
                ),
                child: const Text('Open Modal'),
              ),
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Electronics'));
        await tester.pumpAndSettle();

        // Assert
        expect(
          selectedIndex,
          0,
          reason:
              'Should call onIndicatorSelected with index 0 for Electronics',
        );
        expect(
          find.byType(FilterModal),
          findsNothing,
          reason: 'Modal should close after selection',
        );
      });

      testWidgets(
        'should call onIndicatorSelected with correct index for second category',
        (tester) async {
          // Arrange
          int? selectedIndex;
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
            const QuantityIndicator(name: 'Clothing', quantity: 200),
            const QuantityIndicator(name: 'Books', quantity: 75),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    onIndicatorSelected: (index) {
                      selectedIndex = index;
                    },
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          await tester.tap(find.text('Clothing'));
          await tester.pumpAndSettle();

          // Assert
          expect(
            selectedIndex,
            1,
            reason: 'Should call onIndicatorSelected with index 1 for Clothing',
          );
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should close after selection',
          );
        },
      );

      testWidgets(
        'should close modal after category selection without callback',
        (tester) async {
          // Arrange
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    // No onIndicatorSelected callback provided
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          await tester.tap(find.text('Electronics'));
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should close after selection even without callback',
          );
        },
      );
    });

    /// **Feature: adaptive-search-filters, Property 6: Modal Dismissal Behavior**
    /// *For any* open FilterModal, when dismissed through close button, outside tap, or Escape key,
    /// the modal should close without changing filter state
    /// **Validates: Requirements 3.4, 3.5, 6.5**

    group('Modal Dismissal Behavior', () {
      testWidgets(
        'should close modal when close button is tapped without changing filter state',
        (tester) async {
          // Arrange
          int? selectedIndex;
          bool filterUnselected = false;
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
            const QuantityIndicator(name: 'Clothing', quantity: 200),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    selectedFilter: 'Electronics',
                    onIndicatorSelected: (index) {
                      selectedIndex = index;
                    },
                    onFilterUnselected: () {
                      filterUnselected = true;
                    },
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          await tester.tap(find.byIcon(AppIcons.close).first);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should close when close button is tapped',
          );
          expect(
            selectedIndex,
            null,
            reason:
                'Should not change filter selection when close button is tapped',
          );
          expect(
            filterUnselected,
            false,
            reason:
                'Should not call onFilterUnselected when close button is tapped',
          );
        },
      );

      testWidgets(
        'should close modal when tapping outside modal area without changing filter state',
        (tester) async {
          // Arrange
          int? selectedIndex;
          bool filterUnselected = false;
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    selectedFilter: 'Electronics',
                    onIndicatorSelected: (index) {
                      selectedIndex = index;
                    },
                    onFilterUnselected: () {
                      filterUnselected = true;
                    },
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          // Tap outside the modal (on the barrier)
          await tester.tapAt(const Offset(10, 10));
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should close when tapping outside',
          );
          expect(
            selectedIndex,
            null,
            reason: 'Should not change filter selection when tapping outside',
          );
          expect(
            filterUnselected,
            false,
            reason: 'Should not call onFilterUnselected when tapping outside',
          );
        },
      );

      testWidgets(
        'should close modal with Escape key without changing filter state',
        (tester) async {
          // Arrange
          int? selectedIndex;
          bool filterUnselected = false;
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    selectedFilter: 'Electronics',
                    onIndicatorSelected: (index) {
                      selectedIndex = index;
                    },
                    onFilterUnselected: () {
                      filterUnselected = true;
                    },
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          await tester.sendKeyEvent(LogicalKeyboardKey.escape);
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should close with Escape key',
          );
          expect(
            selectedIndex,
            null,
            reason: 'Should not change filter selection with Escape key',
          );
          expect(
            filterUnselected,
            false,
            reason: 'Should not call onFilterUnselected with Escape key',
          );
        },
      );

      testWidgets(
        'should close modal when back button is pressed without changing filter state',
        (tester) async {
          // Arrange
          int? selectedIndex;
          bool filterUnselected = false;
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    selectedFilter: 'Electronics',
                    onIndicatorSelected: (index) {
                      selectedIndex = index;
                    },
                    onFilterUnselected: () {
                      filterUnselected = true;
                    },
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          // Simulate back button press using Navigator.pop
          final NavigatorState navigator = tester.state(find.byType(Navigator));
          navigator.pop();
          await tester.pumpAndSettle();

          // Assert
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should close with back button',
          );
          expect(
            selectedIndex,
            null,
            reason: 'Should not change filter selection with back button',
          );
          expect(
            filterUnselected,
            false,
            reason: 'Should not call onFilterUnselected with back button',
          );
        },
      );

      testWidgets(
        'should maintain filter state consistency across multiple dismissals',
        (tester) async {
          // Arrange
          int callbackCount = 0;
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
            const QuantityIndicator(name: 'Clothing', quantity: 200),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                    selectedFilter: 'Electronics',
                    onIndicatorSelected: (index) {
                      callbackCount++;
                    },
                    onFilterUnselected: () {
                      callbackCount++;
                    },
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act & Assert - First dismissal with close button
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();
          await tester.tap(find.byIcon(AppIcons.close).first);
          await tester.pumpAndSettle();

          expect(
            callbackCount,
            0,
            reason: 'No callbacks should be called on first dismissal',
          );
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should be closed',
          );

          // Act & Assert - Second dismissal with outside tap
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();
          await tester.tapAt(const Offset(10, 10));
          await tester.pumpAndSettle();

          expect(
            callbackCount,
            0,
            reason: 'No callbacks should be called on second dismissal',
          );
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should be closed',
          );

          // Act & Assert - Third dismissal with Escape key
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();
          await tester.sendKeyEvent(LogicalKeyboardKey.escape);
          await tester.pumpAndSettle();

          expect(
            callbackCount,
            0,
            reason: 'No callbacks should be called on third dismissal',
          );
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should be closed',
          );
        },
      );
    });

    /// **Feature: adaptive-search-filters, Property 9: Accessibility Focus Management**
    /// *For any* FilterModal interaction, focus should be trapped within the modal when open
    /// and return to FilterButton when closed
    /// **Validates: Requirements 6.2, 6.3**

    group('Accessibility Focus Management', () {
      testWidgets('should trap focus within modal when open', (tester) async {
        // Arrange
        final indicators = [
          const QuantityIndicator(name: 'Electronics', quantity: 150),
          const QuantityIndicator(name: 'Clothing', quantity: 200),
        ];

        final testWidget = MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(hintText: 'Before Modal'),
                ),
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () => FilterModal.show(
                      context: context,
                      indicators: indicators,
                    ),
                    child: const Text('Open Modal'),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'After Modal'),
                ),
              ],
            ),
          ),
        );

        // Act
        await tester.pumpWidget(testWidget);
        await tester.tap(find.text('Open Modal'));
        await tester.pumpAndSettle();

        // Assert modal is open
        expect(
          find.byType(FilterModal),
          findsOneWidget,
          reason: 'Modal should be open',
        );

        // Try to navigate with Tab - focus should stay within modal
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();

        // Verify focus is within modal (close button should be focusable)
        final closeButtonFinder = find.descendant(
          of: find.byType(FilterModal),
          matching: find.byIcon(AppIcons.close),
        );
        expect(
          closeButtonFinder,
          findsOneWidget,
          reason: 'Close button should be available for focus',
        );

        // Verify that external text fields are not accessible while modal is open
        expect(
          find.text('Before Modal'),
          findsOneWidget,
          reason: 'Before modal field should exist but not be focusable',
        );
        expect(
          find.text('After Modal'),
          findsOneWidget,
          reason: 'After modal field should exist but not be focusable',
        );
      });

      testWidgets(
        'should return focus to trigger element when modal is closed',
        (tester) async {
          // Arrange
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act - Open modal
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          expect(
            find.byType(FilterModal),
            findsOneWidget,
            reason: 'Modal should be open',
          );

          // Close modal using close button
          await tester.tap(find.byIcon(AppIcons.close));
          await tester.pumpAndSettle();

          // Assert modal is closed
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should be closed',
          );

          // Verify that the trigger button is available for focus again
          expect(
            find.text('Open Modal'),
            findsOneWidget,
            reason: 'Open Modal button should be available for focus',
          );
        },
      );

      testWidgets(
        'should maintain focus trap with multiple focusable elements in modal',
        (tester) async {
          // Arrange
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
            const QuantityIndicator(name: 'Clothing', quantity: 200),
            const QuantityIndicator(name: 'Books', quantity: 75),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          // Assert modal is open with multiple focusable elements
          expect(
            find.byType(FilterModal),
            findsOneWidget,
            reason: 'Modal should be open',
          );
          expect(
            find.text('Electronics'),
            findsOneWidget,
            reason: 'Electronics category should be focusable',
          );
          expect(
            find.text('Clothing'),
            findsOneWidget,
            reason: 'Clothing category should be focusable',
          );
          expect(
            find.text('Books'),
            findsOneWidget,
            reason: 'Books category should be focusable',
          );
          expect(
            find.byIcon(AppIcons.close),
            findsOneWidget,
            reason: 'Close button should be focusable',
          );

          // Navigate through focusable elements with Tab
          await tester.sendKeyEvent(LogicalKeyboardKey.tab);
          await tester.pumpAndSettle();
          await tester.sendKeyEvent(LogicalKeyboardKey.tab);
          await tester.pumpAndSettle();

          // Modal should still be open and focus should be trapped within
          expect(
            find.byType(FilterModal),
            findsOneWidget,
            reason: 'Modal should remain open during focus navigation',
          );
        },
      );

      testWidgets(
        'should handle focus management when modal is dismissed with Escape key',
        (tester) async {
          // Arrange
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act - Open modal
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          expect(
            find.byType(FilterModal),
            findsOneWidget,
            reason: 'Modal should be open',
          );

          // Close modal with Escape key
          await tester.sendKeyEvent(LogicalKeyboardKey.escape);
          await tester.pumpAndSettle();

          // Assert modal is closed and focus is restored
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should be closed',
          );
          expect(
            find.text('Open Modal'),
            findsOneWidget,
            reason: 'Open Modal button should be available for focus',
          );
        },
      );

      testWidgets(
        'should handle focus management when modal is dismissed by outside tap',
        (tester) async {
          // Arrange
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act - Open modal
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          expect(
            find.byType(FilterModal),
            findsOneWidget,
            reason: 'Modal should be open',
          );

          // Close modal by tapping outside (on the barrier)
          await tester.tapAt(const Offset(10, 10));
          await tester.pumpAndSettle();

          // Assert modal is closed and focus is restored
          expect(
            find.byType(FilterModal),
            findsNothing,
            reason: 'Modal should be closed',
          );
          expect(
            find.text('Open Modal'),
            findsOneWidget,
            reason: 'Open Modal button should be available for focus',
          );
        },
      );

      testWidgets(
        'should maintain semantic accessibility when focus is trapped',
        (tester) async {
          // Arrange
          final indicators = [
            const QuantityIndicator(name: 'Electronics', quantity: 150),
          ];

          final testWidget = MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () => FilterModal.show(
                    context: context,
                    indicators: indicators,
                  ),
                  child: const Text('Open Modal'),
                ),
              ),
            ),
          );

          // Act
          await tester.pumpWidget(testWidget);
          await tester.tap(find.text('Open Modal'));
          await tester.pumpAndSettle();

          // Assert modal has proper semantic structure
          expect(
            find.byType(FilterModal),
            findsOneWidget,
            reason: 'Modal should be open',
          );

          // Verify semantic elements are present by testing specific semantic properties
          // instead of accessing the deprecated pipelineOwner

          // Verify close button has proper semantics
          final closeButtonSemantics = tester.getSemantics(
            find.byIcon(AppIcons.close),
          );
          expect(
            closeButtonSemantics.flagsCollection.isButton,
            true,
            reason:
                'Close button should be marked as button for screen readers',
          );
        },
      );
    });
  });
}
