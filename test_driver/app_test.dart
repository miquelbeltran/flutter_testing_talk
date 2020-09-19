// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Gif Review App Driver', () {
    final gifFinder = find.byValueKey('gif-score-1');
    final titleFinder = find.descendant(
      of: gifFinder,
      matching: find.byValueKey('gif-title'),
    );

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('title is displayed', () async {
      expect(await driver.getText(titleFinder), "Kermit Sipping Tea");
    });
  });
}
