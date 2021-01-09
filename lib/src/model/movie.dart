class Movie {
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  double voteAverage;
  int voteCount;
  Movie(
      {this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json)
      : overview = json['overview'] as String,
        posterPath = json['poster_path'] as String,
        releaseDate = json['release_date'] as String,
        title = json['title'] as String,
        voteAverage = double.parse(json['vote_average'].toString()),
        voteCount = json['vote_count'] as int;

  String get posterUrl => 'http://image.tmdb.org/t/p/w500/${this.posterPath}';
}
