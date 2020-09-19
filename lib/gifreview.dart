import 'package:flutter/material.dart';
import 'package:flutter_testing_talk/api_service.dart';
import 'package:flutter_testing_talk/model.dart';
import 'package:flutter_testing_talk/review.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GifReview extends StatefulWidget {
  final Gif gif;

  GifReview(this.gif);

  @override
  _GifReviewState createState() => _GifReviewState();
}

class _GifReviewState extends State<GifReview> {
  ApiService apiService;
  double rating = 0;
  List<Rating> ratings = [];

  @override
  void initState() {
    super.initState();
    apiService = Provider.of<ApiService>(context, listen: false);

    apiService
        .getMyRating(widget.gif.id)
        .then((value) => setState(() => rating = value));

    apiService
        .getRatings(widget.gif.id)
        .then((value) => setState(() => ratings = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          Text(
            widget.gif.title,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 8),
          Image.network(widget.gif.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your Score',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          SmoothStarRating(
              size: 60,
              rating: rating ?? 0,
              onRatingChanged: (rating) {
                apiService.setRating(widget.gif.id, rating);
              }),
          Expanded(
            child: ListView.builder(
              itemCount: ratings?.length ?? 0,
              itemBuilder: (context, position) {
                return Review(ratings[position]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
