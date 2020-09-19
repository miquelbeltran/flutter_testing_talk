import 'package:flutter_testing_talk/model.dart';

double calculateAverage(List<Rating> ratings) {
  return ratings.map((e) => e.rating).reduce((a, b) => a + b) / ratings.length;
}
