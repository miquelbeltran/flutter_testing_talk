// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_talk/api_service.dart';
import 'package:flutter_testing_talk/gifscore.dart';
import 'package:flutter_testing_talk/homepage.dart';

import 'package:flutter_testing_talk/model.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

class _FakeApiService implements ApiService {
  final gif = Gif(
    id: '1',
    title: 'Kermit Sipping Tea',
    url:
    'https://firebasestorage.googleapis.com/v0/b/firestore-talk.appspot.com/o/1.gif?alt=media&token=2c2c20b4-347d-488f-a503-1357a40190a2',
    rating: 3.5,
  );

  bool wasCalled;

  @override
  Future<List<Gif>> getGifs() {
    wasCalled = true;
    return SynchronousFuture([gif]);
  }

  @override
  Future<double> getMyRating(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Rating>> getRatings(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> setRating(String id, double rating) {
    throw UnimplementedError();
  }

}

void main() {
  group('Fake Widget Tests', () {
    testWidgets('load homescreen with fakes', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {

        final fakeApiService = _FakeApiService();

        await tester.pumpWidget(
          Provider<ApiService>(
            create: (context) => fakeApiService,
            child: MaterialApp(home: HomePage()),
          ),
        );

        expect(find.text('Kermit Sipping Tea'), findsOneWidget);

        expect(fakeApiService.wasCalled, isTrue);
      });
    });
  });
}
