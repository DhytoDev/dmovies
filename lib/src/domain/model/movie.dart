import 'package:equatable/equatable.dart';

import 'genre.dart';

class Movie extends Equatable {
  final int id;
  final bool adult;
  final String backdropPath;
  final String posterPath;
  final int budget;
  final List<Genre> genres;
  final String? imdbId;
  final String? originalLanguage;
  final String overview;
  final double popularity;
  final String releaseDate;
  final int? revenue;
  final String? status;
  final String? tagline;
  final bool video;
  final String title;
  final double voteAverage;
  final int voteCount;

  const Movie({
    this.id = -1,
    this.adult = false,
    this.backdropPath = "",
    this.posterPath = "",
    this.budget = 0,
    this.genres = const [],
    this.imdbId,
    this.originalLanguage,
    this.overview = "",
    this.popularity = 0,
    this.releaseDate = "",
    this.revenue,
    this.status,
    this.tagline,
    this.video = false,
    this.title = "",
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  @override
  List<Object?> get props => [
        id,
        adult,
        title,
        backdropPath,
        posterPath,
        budget,
        genres,
        overview,
        popularity
      ];
}
