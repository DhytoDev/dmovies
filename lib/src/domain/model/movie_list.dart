import 'package:equatable/equatable.dart';

import 'movie.dart';

class MovieList extends Equatable {
  final int page;
  final List<Movie> movies;
  final int totalPages;

  const MovieList({
    this.page= 0,
    this.movies = const [],
    this.totalPages = 0,
  });

  @override
  List<Object?> get props => [page, movies];

  MovieList copyWith({List<Movie>? movies}) {
    return MovieList(
      page: page,
      movies: movies ?? this.movies,
    );
  }
}
