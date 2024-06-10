import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_cat/presentation/views/widgets/breed_image.dart';

void main() {
  group('BreadImage tests', () {
    testWidgets('renders image with valid URL', (WidgetTester tester) async {
      const imageUrl = 'https://cdn2.thecatapi.com/images/13MkvUreZ.jpg';
      await tester
          .pumpWidget(MaterialApp(home: BreadImage(imageUrl: imageUrl)));

      expect(find.image(const NetworkImage(imageUrl)), findsOneWidget);
    });

    // testWidgets('renders error message with invalid URL',
    //     (WidgetTester tester) async {
    //   const invalidUrl =
    //       'https://cdn2.thecatapi.com/images'; // Replace with a known invalid URL
    //   await tester
    //       .pumpWidget(MaterialApp(home: BreadImage(imageUrl: invalidUrl)));

    //   expect(find.text('Failed to load image'), findsOneWidget);
    // });

    testWidgets('renders "No image available" when imageUrl is empty',
        (WidgetTester tester) async {
      const emptyUrl = '';
      await tester
          .pumpWidget(MaterialApp(home: BreadImage(imageUrl: emptyUrl)));

      expect(find.text('No image available'), findsOneWidget);
    });
  });
}
