import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_talk/model.dart';
import 'package:flutter_testing_talk/util.dart';

void main() {
  final ratings = [
    Rating('Miguel', 5),
    Rating('Lara', 4),
    Rating('Lily', 3),
  ];

  test('calculate ratings', () {
    final average = calculateAverage(ratings);
    expect(average, 4);
  });


  // expect(ratings, isNotEmpty);
}
