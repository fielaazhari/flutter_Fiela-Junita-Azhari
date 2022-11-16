import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/pages/add_contact_page.dart';

void main() {
  testWidgets(
    'Check Title',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddContactPage(),
        ),
      );
      expect(find.text('Create Contact'), findsOneWidget);
    },
  );
  testWidgets(
    'Check Body',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddContactPage(),
        ),
      );

      var textFormField = find.byType(TextFormField);
      expect(textFormField, findsWidgets);

      var button = find.text('CREATE CONTACT');
      expect(button, findsOneWidget);
    },
  );

// Error karena tidak ada button Create Contacts
  testWidgets(
    'Check Bodys',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddContactPage(),
        ),
      );

      var button = find.text('Create Contacts');
      expect(button, findsOneWidget);
    },
  );
}
