// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_talk/gifscore.dart';

import 'package:flutter_testing_talk/model.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  group('Basic Widget Tests', () {
    testWidgets('display GifScore', (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        final gif = Gif(
          id: '1',
          title: 'Kermit Sipping Tea',
          url:
              'https://firebasestorage.googleapis.com/v0/b/firestore-talk.appspot.com/o/1.gif?alt=media&token=2c2c20b4-347d-488f-a503-1357a40190a2',
          rating: 3.5,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: GifScore(
              gif,
            ),
          ),
        );

        expect(find.text('Kermit Sipping Tea'), findsOneWidget);
      });
    });
  });
}
