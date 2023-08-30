import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_tutorial_01/main.dart';

void main() {
  testWidgets('Build correctly setup and is loaded',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Find the text input and string stating 0 todos created
    expect(find.byKey(textfieldKey), findsOneWidget);
    expect(find.byKey(itemsLeftStringKey), findsOneWidget);
  });

  testWidgets('Adding a new todo item shows a card',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Find the text input and string stating 0 todos created
    expect(find.byKey(textfieldKey), findsOneWidget);
    expect(find.byKey(itemsLeftStringKey), findsOneWidget);
    expect(find.byKey(itemCardWidgetKey), findsNothing);

    // Type text into todo input
    await tester.enterText(find.byKey(textfieldKey), 'new todo');
    expect(
        find.descendant(
          of: find.byKey(textfieldKey),
          matching: find.text('new todo'),
        ),
        findsOneWidget);
    await tester.testTextInput.receiveAction(TextInputAction.done);

    // Input is cleared
    expect(
      find.descendant(
          of: find.byKey(textfieldKey), matching: find.text('new todo')),
      findsNothing,
    );

    // Pump the widget so it renders the new item
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Expect to find at least one widget, pertaining to the one that was added
    expect(find.byKey(itemCardWidgetKey), findsOneWidget);
  });

  testWidgets('Adding a new todo item and checking it as done',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Find the text input and string stating 0 todos created
    expect(find.byKey(textfieldKey), findsOneWidget);
    expect(find.byKey(itemCardWidgetKey), findsNothing);

    // Type text into todo input
    await tester.enterText(find.byKey(textfieldKey), 'new todo');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    // Pump the widget so it renders the new item
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Expect to find at least one widget, pertaining to the one that was added
    expect(find.byKey(itemCardWidgetKey), findsOneWidget);

    // Getting widget to test its value
    Finder checkboxFinder = find.descendant(
        of: find.byKey(itemCardWidgetKey), matching: find.byType(Icon));
    Icon checkboxWidget = tester.firstWidget<Icon>(checkboxFinder);
    expect(checkboxWidget.icon, Icons.radio_button_unchecked);

    // Tap on item card
    await tester.tap(find.byKey(itemCardWidgetKey));
    await tester.pump(const Duration(seconds: 2));

    // Updating item card widget and checkbox value should be true
    checkboxWidget = tester.firstWidget<Icon>(checkboxFinder);
    expect(checkboxWidget.icon, Icons.task_alt);
  });

//   testWidgets('Adding a new todo item and clicking timer button',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(const MyApp());
//     await tester.pumpAndSettle();

//     // Find the text input and string stating 0 todos created
//     expect(find.byKey(textfieldKey), findsOneWidget);
//     expect(find.byKey(itemCardWidgetKey), findsNothing);

//     // Tap textfield to open new page to create todo item
//     await tester.tap(find.byKey(textfieldKey));
//     await tester.pumpAndSettle(const Duration(seconds: 2));

//     // Type text into todo input and tap "Save" button to add new todo item
//     // await tester.enterText(find.byKey(textfieldOnNewPageKey), 'new todo');
//     // await tester.tap(find.byKey(saveButtonKey));
//     // await tester.pumpAndSettle(const Duration(seconds: 2));

//     // Pump the widget so it renders the new item
//     await tester.pumpAndSettle(const Duration(seconds: 2));

//     // Expect to find at least one widget, pertaining to the one that was added
//     expect(find.byKey(itemCardWidgetKey), findsOneWidget);

//     // Getting widget to test its value
//     ElevatedButton buttonWidget =
//         tester.firstWidget<ElevatedButton>(find.byKey(itemCardTimerButtonKey));

//     // Button should be stopped
//     Text buttonText = buttonWidget.child as Text;
//     expect(buttonText.data, "Start");

//     // Tap on timer button.
//     await tester.tap(find.byKey(itemCardTimerButtonKey));
//     await tester.pump(const Duration(seconds: 2));
//     await tester.pumpAndSettle();

//     // Updating widget and button should be ongoing
//     buttonWidget =
//         tester.firstWidget<ElevatedButton>(find.byKey(itemCardTimerButtonKey));
//     buttonText = buttonWidget.child as Text;
//     expect(buttonText.data, "Stop");

//     // Tap on timer button AGAIN
//     await tester.tap(find.byKey(itemCardTimerButtonKey));
//     await tester.pump(const Duration(seconds: 2));
//     await tester.pumpAndSettle();

//     // Updating widget and button should be stopped
//     buttonWidget =
//         tester.firstWidget<ElevatedButton>(find.byKey(itemCardTimerButtonKey));
//     buttonText = buttonWidget.child as Text;
//     expect(buttonText.data, "Resume");
//   });
}
