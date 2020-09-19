import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_talk/model.dart';
import 'package:flutter_testing_talk/util.dart';

void main() {
  test('calculate ratings', () {
    final ratings = [
      Rating('Miguel', 5),
      Rating('Lara', 4),
      Rating('Lily', 3),
    ];

    final average = Util.calculateAverage(ratings);
    expect(average, 4);

    // expect(ratings, isNotEmpty);
  });
}
