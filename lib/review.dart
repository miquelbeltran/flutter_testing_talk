import 'package:flutter/material.dart';
import 'package:flutter_testing_talk/model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Review extends StatelessWidget {
  Rating rating;

  Review(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmoothStarRating(
            rating: rating.rating,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(rating.user),
        ),
      ],
    );
  }
}
