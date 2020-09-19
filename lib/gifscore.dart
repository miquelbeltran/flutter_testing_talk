import 'package:flutter/material.dart';
import 'package:flutter_testing_talk/gifreview.dart';
import 'package:flutter_testing_talk/model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GifScore extends StatelessWidget {
  Gif gif;

  GifScore(this.gif);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('gif-score-${gif.id}'),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => GifReview(gif)));
        },
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            Text(
              gif.title,
              key: Key('gif-title'),
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 8),
            Image.network(gif.url),
            const SizedBox(height: 8),
            SmoothStarRating(
              size: 60,
              rating: gif.rating,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
