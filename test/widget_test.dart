import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';
import 'package:stateless_lab_exam/shopping_cart_page.dart';

void main() {
  testWidgets('ShoppingCartPage renders and prints all required messages', (WidgetTester tester) async {
    // Set a phone/tablet viewport size to allow scrolling cleanly
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MyApp());

    // Verify main components render
    expect(find.byType(ShoppingCartPage), findsOneWidget);
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.text('CAMPUS STORE'), findsOneWidget);
    expect(find.text('Ready for checkout'), findsOneWidget);
    expect(find.text('Deliver to Glenn Oliva'), findsOneWidget);
    expect(find.text('Order Items'), findsOneWidget);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('USB-C Hub'), findsOneWidget);
    expect(find.text('Laptop Stand'), findsOneWidget);
    expect(find.text('STUDENT10 applied'), findsOneWidget);
    expect(find.text('Payment Summary'), findsOneWidget);
    expect(find.text('Place Order'), findsOneWidget);

    // 1. Back arrow
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    // 2. Shopping bag
    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    await tester.pump();

    // 3. Change delivery address
    await tester.tap(find.text('Change'));
    await tester.pump();

    // 4. Plus, Minus, and Delete buttons for each product
    final addButtons = find.byIcon(Icons.add);
    final removeButtons = find.byIcon(Icons.remove);
    final deleteButtons = find.byIcon(Icons.delete_outline);

    // Wireless Mouse
    await tester.tap(addButtons.at(0));
    await tester.pump();
    await tester.tap(removeButtons.at(0));
    await tester.pump();
    await tester.tap(deleteButtons.at(0));
    await tester.pump();

    // USB-C Hub
    await tester.tap(addButtons.at(1));
    await tester.pump();
    await tester.tap(removeButtons.at(1));
    await tester.pump();
    await tester.tap(deleteButtons.at(1));
    await tester.pump();

    // Laptop Stand
    await tester.tap(addButtons.at(2));
    await tester.pump();
    await tester.tap(removeButtons.at(2));
    await tester.pump();
    await tester.tap(deleteButtons.at(2));
    await tester.pump();

    // 5. Place order button
    final placeOrderFinder = find.widgetWithText(ElevatedButton, 'Place Order');
    await tester.ensureVisible(placeOrderFinder);
    await tester.tap(placeOrderFinder);
    await tester.pump();
  });
}
