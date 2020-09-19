class Gif {
  final String id;
  final String title;
  final String url;
  final double rating;

  Gif({
    this.id,
    this.title,
    this.url,
    this.rating,
  });
}

class Rating {
  final String user;
  final double rating;

  Rating(this.user, this.rating);
}
