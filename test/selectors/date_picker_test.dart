import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  group('MacosDatePicker tests', () {
    testWidgets(
      'Textual MacosDatePicker renders the expected date',
      (tester) async {
        final today = DateTime.now();
        await tester.pumpWidget(
          MacosApp(
            home: MacosWindow(
              child: MacosScaffold(
                children: [
                  ContentArea(
                    builder: (context, scrollController) {
                      return Center(
                        child: MacosDatePicker(
                          onDateChanged: (date) {},
                          style: DatePickerStyle.textual,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.text('/'), findsNWidgets(2));
        expect(find.text('${today.day}'), findsOneWidget);
        expect(find.text('${today.month}'), findsOneWidget);
        expect(find.text('${today.year}'), findsOneWidget);
      },
    );

    testWidgets(
      'Can select the date field element and change the value',
      (tester) async {
        final today = DateTime.now();
        await tester.pumpWidget(
          MacosApp(
            home: MacosWindow(
              child: MacosScaffold(
                children: [
                  ContentArea(
                    builder: (context, scrollController) {
                      return Center(
                        child: MacosDatePicker(
                          onDateChanged: (date) {},
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        int day = today.day;
        final dayFieldElement = find.text('${today.day}').first;
        final upCaretControl = find.byType(CustomPaint).first;
        final downCaretControl = find.byType(CustomPaint).last;
        await tester.tap(dayFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(upCaretControl);
        await tester.pumpAndSettle();
        day++;
        expect(day, today.day + 1);
        await tester.tap(dayFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(downCaretControl);
        await tester.pumpAndSettle();
        day--;
        expect(day, today.day);
        await tester.tap(dayFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(downCaretControl);
        await tester.pumpAndSettle();
        day--;
        expect(day, today.day - 1);
      },
    );

    testWidgets(
      'Can select the month field element and change the value',
      (tester) async {
        final today = DateTime.now();
        await tester.pumpWidget(
          MacosApp(
            home: MacosWindow(
              child: MacosScaffold(
                children: [
                  ContentArea(
                    builder: (context, scrollController) {
                      return Center(
                        child: MacosDatePicker(
                          onDateChanged: (date) {},
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        int month = today.month;
        final monthFieldElement = find.text('${today.month}').first;
        final upCaretControl = find.byType(CustomPaint).first;
        final downCaretControl = find.byType(CustomPaint).last;
        await tester.tap(monthFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(upCaretControl);
        await tester.pumpAndSettle();
        month++;
        expect(month, today.month + 1);
        await tester.tap(monthFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(downCaretControl);
        await tester.pumpAndSettle();
        month--;
        expect(month, today.month);
        await tester.tap(monthFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(downCaretControl);
        await tester.pumpAndSettle();
        month--;
        expect(month, today.month - 1);
      },
    );

    testWidgets(
      'Can select the month field element and change the value',
      (tester) async {
        final today = DateTime.now();
        await tester.pumpWidget(
          MacosApp(
            home: MacosWindow(
              child: MacosScaffold(
                children: [
                  ContentArea(
                    builder: (context, scrollController) {
                      return Center(
                        child: MacosDatePicker(
                          onDateChanged: (date) {},
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        int year = today.year;
        final yearFieldElement = find.text('${today.year}');
        final upCaretControl = find.byType(CustomPaint).first;
        final downCaretControl = find.byType(CustomPaint).last;
        await tester.tap(yearFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(upCaretControl);
        await tester.pumpAndSettle();
        year++;
        expect(year, today.year + 1);
        await tester.tap(yearFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(downCaretControl);
        await tester.pumpAndSettle();
        year--;
        expect(year, today.year);
        await tester.tap(yearFieldElement);
        await tester.pumpAndSettle();
        await tester.tap(downCaretControl);
        await tester.pumpAndSettle();
        year--;
        expect(year, today.year - 1);
      },
    );

    testWidgets(
      'The selected calendar day matches the expected value',
      (tester) async {
        int selectedDay = 0;
        await tester.pumpWidget(
          MacosApp(
            home: MacosWindow(
              child: MacosScaffold(
                children: [
                  ContentArea(
                    builder: (context, scrollController) {
                      return Center(
                        child: MacosDatePicker(
                          onDateChanged: (date) {
                            selectedDay = date.day;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        final dayToSelect = find.text('10');
        await tester.tap(dayToSelect);
        await tester.pumpAndSettle();
        expect(selectedDay, 10);
      },
    );

    testWidgets(
      'Can change the month by clicking the left and right calendar view controls',
      (tester) async {
        final today = DateTime.now();
        int selectedMonth = 0;
        await tester.pumpWidget(
          MacosApp(
            home: MacosWindow(
              child: MacosScaffold(
                children: [
                  ContentArea(
                    builder: (context, scrollController) {
                      return Center(
                        child: MacosDatePicker(
                          onDateChanged: (date) {
                            selectedMonth = date.month;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );

        final leftControl = find.byType(MacosIcon).first;
        final rightControl = find.byType(MacosIcon).last;
        await tester.tap(leftControl);
        await tester.pumpAndSettle();
        expect(selectedMonth, today.month - 1);
        await tester.tap(rightControl);
        await tester.pumpAndSettle();
        expect(selectedMonth, today.month);
        await tester.tap(rightControl);
        await tester.pumpAndSettle();
        expect(selectedMonth, today.month + 1);
      },
    );
  });
}
