import 'dart:async';

import 'package:flutter_testing_talk/model.dart';

abstract class ApiService {
  /// Get all GIFs
  Future<List<Gif>> getGifs();

  /// My rating of a specific GIF
  Future<double> getMyRating(String id);

  /// Set a rating to a GIF
  Future<void> setRating(String id, double rating);

  /// Get all ratings of a GIF
  Future<List<Rating>> getRatings(String id);
}

class FakeApiService implements ApiService {
  final gifs = [
    Gif(
      id: '1',
      title: 'Kermit Sipping Tea',
      url:
          'https://firebasestorage.googleapis.com/v0/b/firestore-talk.appspot.com/o/1.gif?alt=media&token=2c2c20b4-347d-488f-a503-1357a40190a2',
      rating: 3.5,
    ),
    Gif(
      id: '2',
      title: 'Spongebob Rainbow',
      url:
          'https://firebasestorage.googleapis.com/v0/b/firestore-talk.appspot.com/o/2.gif?alt=media&token=d5d9cd9f-3d45-4b3c-ab9e-087ba742d632',
      rating: 4.5,
    ),
  ];

  final ratings = [
    Rating('Miguel', 5),
    Rating('Lara', 4),
    Rating('Lily', 3),
  ];

  @override
  Future<List<Gif>> getGifs() {
    return Future.value(gifs);
  }

  @override
  Future<double> getMyRating(String id) {
    return Future.value(5);
  }

  @override
  Future<List<Rating>> getRatings(String id) {
    return Future.value(ratings);
  }

  @override
  Future<void> setRating(String id, double rating) {
    return Future.value();
  }
}
