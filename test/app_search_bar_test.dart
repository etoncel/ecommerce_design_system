import 'package:ecommerce_sample_design_system/ecommerce_sample_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Search bar tests', () {
    testWidgets(
      'On tap Search button should call onSubmmitted callback with text',
      (tester) async {
        // Arrange
        TextEditingController controller =
            TextEditingController(); // Controlador del texto del input
        String searchText = '';
        int submittedCalledCount = 0;
        final sut = MaterialApp(
          home: Scaffold(
            body: AppSearchBar(
              controller: controller,
              onSubmitted: (value) {
                searchText = value;
                submittedCalledCount++;
              },
            ),
          ),
        );

        await tester.pumpWidget(sut);

        final input = find.byType(AppInput);

        await tester.enterText(input, "producto");

        final searchButton = find.byType(AppButton);

        await tester.tap(searchButton);

        await tester.pumpAndSettle();

        // Assert
        expect(find.byType(AppSearchBar), findsOneWidget);
        expect(find.text("producto"), findsOne);
        expect(searchText, "producto");
        expect(submittedCalledCount, 1);
      },
    );
  });
}
